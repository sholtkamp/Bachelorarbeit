# Bachelorarbeit
This repository pertains my bachelor thesis titled 'Containerbasierter, automatisierter Workflow zur Verarbeitung 
von UAS-Daten mit Open-Source Software'. [Cotainerized, automated workflow for processing UAS data using open-source software]

## Contents:

### /NDVI/
- Dockerfile to build environment for ndvi.py
- ndvi.py to compute NDVI for multispectral imagery [based on this tutorial](http://learningzone.rspsoc.org.uk/index.php/Learning-Materials/Python-Scripting/9.4-Calculate-NDVI-using-GDAL)
- ndvi_script.bat to run a Docker container for ndvi.py
- results folder

### /ODM/ 
- odm_script.bat to generate ODM environment, and run [ODM](https://github.com/OpenDroneMap/OpenDroneMap)
- image folder
- storage folder

### /QGIS/
- qgis_script.bat to run a cmd interface to run [QGIS](https://www.qgis.org/de/site/) scripts
- QGIS_... folders, each containing:
  - dockerfile
  - model.py
  - model.sh
  - qgis_... .bat
  - models folder
  - used to run a specific QGIS task
- results folder
------------------------------------------------

## Useage:
