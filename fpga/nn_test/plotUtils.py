
import numpy as np
from scipy import signal
from scipy import io
from time import sleep

import plotly.graph_objs as go
import ipywidgets as ipw

from plotly.subplots import make_subplots
import plotly.express as px

from threading import Thread
from threading import Event
from threading import Lock

global pltThreadAmp
global pltThreadCAmp
global pltThreadCAngle
global pltThreadAMAM
global pltThreadAMPM
global pltThreadNRMSE

 

class PlotUtils():
    
    def __init__(self):
        pass
       
    
    def plot(self, n, sigList, nameTrace, im_width=800, im_height=400, titleIn="Title"):    
        fig = go.Figure()
        for i in range(len(sigList)):
            fig.add_trace(go.Scatter(x = n, y = sigList[i], name=nameTrace[i]))
        fig.update_layout(title=titleIn, autosize=False, width=900, height=500, margin=dict(l=50, r=50, b=100, t=100, pad=4) )
        fig.show()

    def subPlot(self):
        fig = make_subplots(rows=1, cols=2)
        fig.add_trace(go.Scatter(y=[4, 2, 1], mode="lines"), row=1, col=1)
        fig.add_trace(go.Bar(y=[2, 1, 3]), row=1, col=2)
        fig.show()

    
    #['solid', 'dot', 'dash', 'longdash', 'dashdot', 'longdashdot']
    def new_plot(self, n, sigList, im_width=800, im_height=400, titleIn="Title", mark = None, nameTrace = None, inFig = None, showLeg=True):    
        if inFig == None:
            fig = go.FigureWidget()
        else:
            fig = inFig
        for i in range(len(sigList)):
            if nameTrace != None:
                nameTr = nameTrace[i] 
            else:
                nameTr = 'trace'+str(i)             
            if mark != None:
                m_style = mark[i]
            else:
                m_style = 'dot'

            fig.add_scatter(x=n[i], y=sigList[i], mode='lines', line=dict(dash=m_style), name=nameTr)
        fig.update_layout(title=titleIn, autosize=False, width=im_width, height=im_height, margin=dict(l=50, r=50, b=100, t=100, pad=4) , showlegend=showLeg)
        #fig.show()
        display(fig)
        return fig
    
    def update_plot(self, fig, n, values, newTrace = False, mark = None, nameTrace = None):
        for i in range(len(values)):
            if newTrace == False:
                fig.data[i].y = values[i]
            else:
                if nameTrace != None:
                    nameTr = nameTrace[i] 
                else:
                    nameTr = 'trace'+str(i)             
                if mark != None:
                    m_style = mark[i]
                else:
                    m_style = 'dot'
                fig.add_scatter(x=n[i], y=values[i], mode='lines', line=dict(dash=m_style), name=nameTr) 
        fig.update()
    
    
    

     
