REM Preparing workspace for NDVI calculation
docker build -t sholtkamp/ndvi:1.0 . 
REM Running container to calculate NDVI
docker run --name=ndvi_container sholtkamp/ndvi:1.0 
@echo off
mkdir results >nul 2>&1
@cd results
for /f "tokens=1-3 delims=/" %%a in ("%date%") do (set ndvi_dirdate=%%a%%b%%c)
for /f "tokens=1-2 delims=/" %%a in ('time /t') do (set ndvi_dirtime=%%a%%b)
set ndvi_dirname="%ndvi_dirdate%_%ndvi_dirtime%"
set formated_ndvi_dirname=%ndvi_dirname::=.%
mkdir %formated_ndvi_dirname%
@cd ..
@docker cp ndvi_container:/workspace %~dp0
@move %~dp0workspace\ndvi.tif %~dp0results\%formated_ndvi_dirname% >nul
echo on
REM Cleaning up workspace
@docker rm ndvi_container >nul
@rmdir workspace /S /Q >nul
REM Cleanup done