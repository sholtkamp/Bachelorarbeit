REM Fetching copy of odm_orthophoto.tif
@echo off
cd ..
copy odm_orthophoto.tif QGIS_NDVI_unsupervised
cd QGIS_NDVI_unsupervised
echo on
REM Calculating NDVI and Classification now
docker build -t ba/qgis_container . 
docker run --name=QGIS ba/qgis_container
REM Making the results accessable in the QGIS\results folder
@docker cp QGIS:/results %~dp0 >nul
@xcopy %~dp0results\* %~dp0..\results /s/h/e/k/f/c
REM Cleaning up workspace
@docker rm QGIS >nul
@del odm_orthophoto.tif
@rmdir results /S /Q >nul
REM Cleanup done
pause