
import numpy as np
from scipy import signal
from scipy import io

import plotly.graph_objs as go
import ipywidgets as ipw


class SigUtils():
    
    def __init__(self):
        pass
   
       
    def find_delay(self, x1, x2, numSamples):        
        if numSamples == 0:
            x1_short = x1
            x2_short = x2
        else:               
            x1_short = x1[0:numSamples]
            x2_short = x2[0:numSamples]
        
        corr = signal.correlate(x1_short,x2_short,"full")
        maxCorrIdx = np.argmax(np.absolute(corr))
        
        return (len(x1_short) - maxCorrIdx)
    
    
       
    def align_sigs(self,x1,x2, os_fact, offsetDelay=0, numSamples=0):
        t_orig = np.arange(0, len(x1), 1)
        t1_new = np.arange(0, len(x1), 1/os_fact)
        t2_new = np.arange(0, len(x2), 1/os_fact)

        x1_interp = np.interp(t1_new, t_orig, x1)
        x2_interp = np.interp(t2_new, t_orig, x2)
        
        d = self.find_delay(x1_interp, x2_interp, numSamples*os_fact)
        x2_interp_d = np.roll(x2_interp,-1*(d+(offsetDelay*os_fact)))   
         
        x2_a_dec = signal.decimate(x2_interp_d, os_fact)
        #x2_a_dec = x2_interp_d[0:len(x2_interp_d):os_fact]
        
        return x2_a_dec, np.int32(d/os_fact)
    
    
    def force_align_sigs(self,x, d, os_fact):
        t_orig = np.arange(0, len(x), 1)
        t2_new = np.arange(0, len(x), 1/os_fact)
        x2_interp = np.interp(t2_new, t_orig, x)                        
        x2_interp_d = np.roll(x2_interp,-1*(d))  
        x2_a_dec = signal.decimate(x2_interp_d, os_fact)
        return x2_a_dec 
    
    
    
    def createSignal(self, pSize, nPulses=1, sigName='blackman', amp=1, phase=0, mat_file=None):
        sigSize = pSize*nPulses
        x = np.zeros(sigSize, dtype=np.complex64)
        if sigName == 'bartlett':
            p = np.bartlett(pSize)
        if sigName == 'blackman':
            p = np.blackman(pSize)
        if sigName == 'hamming':
            p = np.hamming(pSize)
        if sigName == 'hanning':
            p = np.hanning(pSize)
        if sigName == 'const':
            p = np.ones(pSize)
        if sigName == 'counter':
            p = np.arange(0, 1, 1/pSize)
        if sigName == 'blackman_var':
            x = []
            for p_index in range(nPulses):
                p_len = np.random.randint(pSize)
                p_len = max(8, p_len)
                x = np.append(x, np.blackman(p_len))
                x = np.append(x, np.zeros(p_len))
            sigLenOut = len(x) - (len(x)%8)
            return np.complex64(amp*x[0:sigLenOut])
        if sigName == 'rect_var':
            x = []
            for p_index in range(nPulses):
                p_len = np.random.randint(pSize)
                p_len = max(8, p_len)
                x = np.append(x, np.ones(p_len))
                x = np.append(x, np.zeros(p_len))
            sigLenOut = len(x) - (len(x)%8)
            return np.complex64(amp*x[0:sigLenOut])
        if sigName == 'rect':
            p = np.zeros(pSize)
            val = 0
            for i in range(pSize):
                if i < np.int(pSize/2):
                    val = 1
                else:
                    val = 0
                p[i] = val
        if sigName == 'stair':
            p = np.zeros(pSize)
            for i in range(pSize):
                p[i] = (8/(pSize-8))*int((i)/8)
        if sigName == 'step':
            p = np.zeros(pSize)
            val = 0
            for i in range(pSize):
                if i > (pSize/2):
                    p[i] = 1
                else:
                    p[i] = 0                
        if sigName == 'mat':
            if mat_file == None:
                print('ERROR, mat file not specified')
                return
            mat_x = io.loadmat(mat_file)
            x_mat = mat_x['x']
            return np.reshape(x_mat,sigSize)
        
        p_comp = p*np.exp(np.deg2rad(phase)*1j)
        for i in range(nPulses):
            x[pSize*i:(pSize*i)+pSize] = p_comp
        return (amp*x)
  

    def interpSig(self, inSig):
        t_step = 1.2500e-07
        t_step_new = 0.40816e-9
        numPointsNew = int(t_step/t_step_new)
        x_orig = np.linspace(0, t_step*len(inSig), len(inSig))
        x_new = np.linspace(0, t_step*len(inSig), len(inSig)*numPointsNew)
        y_new = np.interp(x_new, x_orig, inSig)
        return y_new


