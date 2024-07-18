
import numpy as np
from time import sleep
from pynq import allocate, MMIO
import xrfdc
from enum import Enum
import pynq
import os

from nn_act import NN_act

fip_factor=32767
        
class PL_If():
    
    def __init__(self, base):
        self.sigLen = dict()
        self.bram_in_re = dict()
        self.bram_in_im = dict()      
        self.bram_out_re = dict()
        self.bram_out_im = dict()    
        
        try:
            bram_re = dir(base.radio.transmitter.channel_00.axi_bram_in_re)
            self.bram_in_re[0] = self.memdict_to_view(base, "radio/transmitter/channel_00/axi_bram_in_re", dtype='int16')
            self.bram_in_im[0] = self.memdict_to_view(base, "radio/transmitter/channel_00/axi_bram_in_im", dtype='int16') 
            self.bram_out_re[0] = self.memdict_to_view(base, "radio/transmitter/channel_00/axi_bram_out_re", dtype='int16')
            self.bram_out_im[0] = self.memdict_to_view(base, "radio/transmitter/channel_00/axi_bram_out_im", dtype='int16')
            self.nn_act = base.radio.transmitter.channel_00.nn_act
        except AttributeError:
            print('BRAM channel_00 not present')
            
        
    
    def memdict_to_view(self, ol, ip, dtype='int16'):
        baseAddress = ol.mem_dict[ip]["phys_addr"]
        mem_range = ol.mem_dict[ip]["addr_range"]
        ipmmio = MMIO(baseAddress, mem_range)
        return ipmmio.array[0:ipmmio.length].view(dtype)
    
           
        
    def loadSignal(self, x, pl_mem):     
        sigLen = len(x)
        s_array = allocate(sigLen, dtype=np.int16)
        s_array[:] = (x*fip_factor).astype('int16')        
        pl_mem[0:sigLen] = s_array
        s_array.freebuffer()
        del s_array        
               
    
    
    def loadSigInMemory(self, x, ch):        
        if np.iscomplexobj(x):
            x_re = np.real(x)
            x_im = np.imag(x)
            self.sigLen[ch] = len(x)
        else:
            x_re = x[0:len(x):2]
            x_im = x[1:len(x):2]
            self.sigLen[ch] = int(len(x)/2)
                   
        if len(x_re) > len(self.bram_in_re[ch]):
            print('Signal size exceeding BRAM size: ', len(self.bram_re[ch]))
            x_re = x_re[0:len(self.bram_in_re[ch])]
            x_im = x_im[0:len(self.bram_in_im[ch])] 
            
        self.loadSignal(x_re, self.bram_in_re[ch])
        self.loadSignal(x_im, self.bram_in_im[ch])

        self.setSigLen(np.uint32(int(len(x_re)/8)))

        
        
    def setSigLen(self, signalLen):
        self.sigLen = signalLen
        self.nn_act.params = int(signalLen & 0xFFFFF)
        
        
    def sendSignal(self, x=[], ch=0):
        self.loadSigInMemory(x, ch)

    def readSignalBack(self, numSamples, ch=0):
        y_re = self.bram_out_re[ch][0:numSamples]
        y_im = self.bram_out_im[ch][0:numSamples]
        return y_re + 1j*y_im 
   