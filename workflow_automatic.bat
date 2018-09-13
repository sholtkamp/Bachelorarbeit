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
REM ##### Step 3 completed #####

