REM Fetching copy of odm_orthophoto.tif
@echo off
cd ..
copy odm_orthophoto.tif QGIS_NDVI
cd QGIS_NDVI
echo on
REM Calculating NDVI now
docker build -t sholtkamp/qgis:1.0 . --no-cache
docker run --name=QGIS sholtkamp/qgis:1.0
REM Making the results accessable in the QGIS\results folder
@docker cp QGIS:/results %~dp0 >nul
@xcopy %~dp0results\* %~dp0..\results /s/h/e/k/f/c
REM Cleaning up workspace
@docker rm QGIS >nul
@del odm_orthophoto.tif
@rmdir results /S /Q >nul
REM Cleanup done