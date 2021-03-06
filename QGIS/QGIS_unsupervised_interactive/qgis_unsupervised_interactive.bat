REM Fetching copy of odm_orthophoto.tif
@echo off
cd ..
copy odm_orthophoto.tif QGIS_unsupervised_interactive
cd QGIS_unsupervised_interactive
@set /p n_c="Enter number of classes: "
echo on
REM Calculating Classification now
docker build -t sholtkamp/qgis:1.0 . --no-cache
docker run --name=QGIS -e number_of_classes=%n_c% sholtkamp/qgis:1.0 
REM Making the results accessable in the QGIS\results folder
@docker cp QGIS:/results %~dp0 >nul
@xcopy %~dp0results\* %~dp0..\results /s/h/e/k/f/c
REM Cleaning up workspace
@docker rm QGIS >nul
@del odm_orthophoto.tif
@rmdir results /S /Q >nul
REM Cleanup done