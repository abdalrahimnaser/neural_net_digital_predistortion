
import xrfclk
import pynq
import pynq.lib
import time


class BaseRF(pynq.Overlay):

    def __init__(self, *args, **kwargs):           
            
        super().__init__(*args, **kwargs)
        
        time.sleep(0.1)
        self.init_rf_clks()


    def init_rf_clks(self, lmk_freq=245.76, lmx_freq=491.52):
        """Initialise the LMK and LMX clocks for the radio hierarchy.

        The radio clocks are required to talk to the RF-DCs and only need
        to be initialised once per session.

        """        
        xrfclk.set_ref_clks(lmk_freq=lmk_freq, lmx_freq=lmx_freq)

  