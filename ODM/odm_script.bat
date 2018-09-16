REM Building ODM environment
@echo off
mkdir odm_georeferencing >nul 2>&1
mkdir odm_orthophoto >nul 2>&1
mkdir odm_texturing >nul 2>&1
mkdir odm_meshing >nul 2>&1
mkdir opensfm >nul 2>&1
mkdir odm_dem >nul 2>&1
echo on
REM Done
REM Running ODM
docker run -it --rm -v "%~dp0images:/code/images" -v "%~dp0odm_dem:/code/odm_dem" -v "%~dp0opensfm:/code/opensfm" -v "%~dp0odm_orthophoto:/code/odm_orthophoto" -v "%~dp0odm_georeferencing:/code/odm_georeferencing" -v "%~dp0odm_texturing:/code/odm_texturing"  -v "%~dp0odm_meshing:/code/odm_meshing" opendronemap/opendronemap:0.3.1 --dsm --time
REM Done
REM Copy generated orthophoto into directories for following steps
@copy "%~dp0odm_orthophoto\odm_orthophoto.tif" "%~dp0..\QGIS"
@copy "%~dp0odm_orthophoto\odm_orthophoto.tif" "%~dp0..\NDVI"
REM Building subfolder for results
@echo off
cd results
for /f "tokens=1-3 delims=/" %%a in ("%date%") do (set odm_dirdate=%%a%%b%%c)
for /f "tokens=1-2 delims=/" %%a in ('time /t') do (set odm_dirtime=%%a%%b)
set odm_dirname="%odm_dirdate%_%odm_dirtime%"
set formated_odm_dirname=%odm_dirname::=.%
mkdir %formated_odm_dirname%
cd ..
echo on
REM Done
REM Moving results to results
@move odm_georeferencing results/%formated_odm_dirname% >nul
@move odm_orthophoto results/%formated_odm_dirname% >nul
@move odm_texturing results/%formated_odm_dirname% >nul
@move odm_meshing results/%formated_odm_dirname% >nul
@move opensfm results/%formated_odm_dirname% >nul
@move odm_dem results/%formated_odm_dirname% >nul
REM Results have been moved to results