REM ##### Started automated workflow #####

REM ##### Step 1: ODM #####
@cd ODM
@call "odm_script.bat"
REM ##### Step 1 completed #####

@echo:
REM ##### Step 2: Standalone NDVI #####
@cd ..\NDVI
@call "ndvi_script.bat"
REM ##### Step 2 completed #####

@echo:
REM ##### Step 3: QGIS Tasks #####
@cd ..\QGIS\QGIS_NDVI
@call "qgis_ndvi.bat"
@cd ..\QGIS_NDVI_unsupervised
@call "qgis_ndvi_unsupervised.bat"
@cd ..\QGIS_unsupervised
@call "qgis_unsupervised.bat"
@cd ..\QGIS_vectorize
@call "qgis_vectorize.bat"
@cd ..\..
REM ##### Step 3 completed #####
pause