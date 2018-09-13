:labels
@echo #######################################
@echo # QGIS_NDVI: ID 1                     #
@echo # QGIS_NDVI_unsupervised: ID 2        #
@echo # QGIS_unsupervised: ID 3             #
@echo # QGIS_unsupervised_interactive: ID 4 #
@echo # QGIS_vectorize: ID 5                #
@echo #######################################
:start
@echo:
@set /p id="To run script enter Script_ID: "
@if %id% EQU 1 (
    cd QGIS_NDVI & call qgis_ndvi
    ) else (
        @if %id% EQU 2 (
            cd QGIS_NDVI_unsupervised & call qgis_ndvi_unsupervised
            ) else (
                @if %id% EQU 3 (
                    cd QGIS_unsupervised & call qgis_unsupervised
                    ) else (
                        @if %id% EQU 4 (
                            cd QGIS_unsupervised_interactive & call qgis_unsupervised_interactive
                            ) else (
                                @if %id% EQU 5 (
                                    cd QGIS_vectorize & call QGIS_vectorize
                                ) else (
                                    echo This is not a valid script ID & goto start
                                )
                            )
                        
                    )
            )
    )
@cd ..
@echo: 
@echo Do you want to continue using scripts?
@CHOICE /C YN /M "Press Y for Yes or N for No"
@IF %ERRORLEVEL% == 1 goto labels
@IF %ERRORLEVEL% == 2 exit