# Copyright (C) 2022 Xilinx, Inc
# SPDX-License-Identifier: BSD-3-Clause



from pynq import DefaultIP



class NN_act(DefaultIP):

    """Driver for the transmit control IP Core.
    
    
    """
    
    def __init__(self, description):
        super().__init__(description=description)      
        
    bindto = ['xilinx.com:hls:nn_act:1.0']
    
    @property
    def params(self):
        return self.read(16)
    
    @params.setter
    def params(self, val):
        self.write(16, val)
   
   
