import os
from tkinter import *
from tkinter import messagebox

window = Tk()
window.title("Bachelorarbeit Interface")
window.geometry('500x200')

def callPortainer():
    os.system("run_portainer.io.bat")
    
def callODM():
    os.chdir("ODM")
    messagebox.showinfo('ODM Reminder', 'Remember to put your images in the ODM\images directory before starting')
    os.system("odm_script.bat")
    os.chdir("..")
    
def callNDVI():
    os.chdir("NDVI")
    os.system("ndvi_script.bat")
    os.chdir("..")

def callQgisNDVI():
    os.chdir("QGIS\QGIS_NDVI")
    os.system("qgis_ndvi.bat")
    os.chdir("..\..")

def callQgisNDVI_unsupervised():
    os.chdir("QGIS\QGIS_NDVI_unsupervised")
    os.system("qgis_ndvi_unsupervised.bat")
    os.chdir("..\..")

def callQgisunsupervised():
    os.chdir("QGIS\QGIS_unsupervised")
    os.system("qgis_unsupervised.bat")
    os.chdir("..\..")

def callQgisvectorize():
    os.chdir("QGIS\QGIS_vectorize")
    os.system("qgis_vectorize.bat")
    os.chdir("..\..")

portainerBtn = Button(window, text="Open Portainer.io", command = callPortainer)
portainerBtn.grid(column=1, row=0, padx=(10, 20), pady=(10, 10))

odmBtn = Button(window, text="Run ODM", command = callODM)
odmBtn.grid(column=2, row=0, pady=(10, 10))

ndviBtn = Button(window, text="Run NDVI", command = callNDVI)
ndviBtn.grid(column=2, row=1, pady=(0, 10))

qgisBtn1 = Button(window, text="Run QGIS: NDVI", command = callQgisNDVI)
qgisBtn1.grid (column=3, row=0, pady=(10, 10))

qgisBtn2 = Button(window, text="Run QGIS: NDVI and Classification", command = callQgisNDVI_unsupervised)
qgisBtn2.grid (column=3, row=1, pady=(0, 10))

qgisBtn3 = Button(window, text="Run QGIS: Unsupervised Classification", command = callQgisunsupervised)
qgisBtn3.grid (column=3, row=2, padx=(20, 0), pady=(0, 10))

qgisBtn4 = Button(window, text="Run QGIS: Vectorize", command = callQgisvectorize)
qgisBtn4.grid (column=3, row=3, padx=(10, 0), pady=(0, 10))

window.mainloop()