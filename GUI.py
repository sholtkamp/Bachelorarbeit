import os
from tkinter import *
from tkinter import messagebox

# Initializing window
window = Tk()
window.title("Bachelorarbeit Interface")
window.geometry('500x200')
window.configure(background="light blue")

# Defining functions to call scripts when corresponding button is pressed
#
# As portainer.io.bat is in the same directory as GUI.py no directory changes are required
def callPortainer():
    os.system("run_portainer.io.bat")

# odm_script.bat is in a child directory
# therefore the functions changes directory one down, calls script and returns for reusability
def callODM():
    os.chdir("ODM")
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

def callQgisvectorize():
    os.chdir("QGIS\QGIS_vectorize")
    os.system("qgis_vectorize.bat")
    os.chdir("..\..")

def callQgisNDVI_unsupervised():
    os.chdir("QGIS\QGIS_NDVI_unsupervised")
    os.system("qgis_ndvi_unsupervised.bat")
    os.chdir("..\..")

def callQgisunsupervised():
    os.chdir("QGIS\QGIS_unsupervised")
    os.system("qgis_unsupervised.bat")
    os.chdir("..\..")

def callQgisunsupervised_interactive():
    os.chdir("QGIS\QGIS_unsupervised_interactive")
    os.system("qgis_unsupervised_interactive.bat")
    os.chdir("..\..")

def callWorkflow():
    os.system("workflow_automatic.bat")

# Building buttons to call the functions
portainerBtn = Button(window, text="Open Portainer.io", command = callPortainer)
portainerBtn.grid(column=1, row=0, padx=(10, 0), pady=(10, 0))

odmBtn = Button(window, text="Run ODM", command = callODM)
odmBtn.grid(column=2, row=0, padx=(10, 0), pady=(10, 0))

ndviBtn = Button(window, text="Run NDVI", command = callNDVI)
ndviBtn.grid(column=2, row=1, padx=(10, 0), pady=(10, 0))

qgisBtn1 = Button(window, text="Run QGIS: NDVI", command = callQgisNDVI)
qgisBtn1.grid (column=3, row=0, sticky=W, padx=(10, 0), pady=(10, 0))

qgisBtn2 = Button(window, text="Run QGIS: Vectorize", command = callQgisvectorize)
qgisBtn2.grid (column=3, row=1, sticky=W, padx=(10, 0), pady=(10, 0))

qgisBtn3 = Button(window, text="Run QGIS: NDVI and Classification", command = callQgisNDVI_unsupervised)
qgisBtn3.grid (column=3, row=2, sticky=W, padx=(10, 0), pady=(10, 0))

qgisBtn4 = Button(window, text="Run QGIS: Unsupervised Classification", command = callQgisunsupervised)
qgisBtn4.grid (column=3, row=3, sticky=W, padx=(10, 0), pady=(10, 0))

qgisBtn5 = Button(window, text="Run QGIS: Unsupervised Classification (interactive)", command = callQgisunsupervised_interactive)
qgisBtn5.grid (column=3, row=4, sticky=W, padx=(10, 0), pady=(10, 0))

workflowBtn=Button(window, text="Run Wofklow", bg="lime green", command = callWorkflow)
workflowBtn.grid(column=1, row=1, padx=(10, 0), pady=(10, 0))

# Reminder to have required data in the specified folders for scripts
messagebox.showinfo('Warning!', 'Remember to make sure the required files for script execution exist! \n\nODM: Images in /ODM/images \nNDVI: odm_orthophoto.tif in /NDVI \nQGIS: odm_orthophoto.tif in /QGIS \nComplete Workflow: Images in /ODM/images')

window.mainloop()