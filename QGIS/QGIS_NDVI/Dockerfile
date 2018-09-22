# Based on the 2016 version written by Daniel Nuest <daniel.nuest@uni-muenster.de>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0

FROM ubuntu:16.04
MAINTAINER Sebastian Holtkamp <Sebastian.Holtkamp@wwu.de>

# Install QGIS and GIS libs from https://launchpad.net/ubuntu/+source/qgis
ENV QGIS_VERSION 2.8.6+dfsg-1ubuntu1

RUN apt-get update \
    && apt-get install -qqy --no-install-recommends \
        gdal-bin \
        python-gdal \
        python-scipy \
        python-numpy \
        python-shapely \
        qgis=$QGIS_VERSION \
        qgis-providers=$QGIS_VERSION \
        python-qgis-common=$QGIS_VERSION \
        python-qgis=$QGIS_VERSION \
        xvfb \
        tree \
		wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install OTB, see https://www.orfeo-toolbox.org/CookBook/Installation.html
ENV OTB_VERSION OTB-5.6.1-Linux64
WORKDIR /otb
RUN wget https://www.orfeo-toolbox.org/packages/archives/OTB/$OTB_VERSION.run -q \
    && chmod +x $OTB_VERSION.run \
    && ./$OTB_VERSION.run \
    && rm $OTB_VERSION.run
# Set non-typical OTB installation dirs for usage in model.py, no profile needed then (see https://github.com/qgis/QGIS/pull/2840/files)
ENV OTB_FOLDER /otb/$OTB_VERSION/bin
ENV OTB_LIB_FOLDER /otb/$OTB_VERSION/lib/otb/applications

# Set environment variables for workflow execution
ENV PYTHONPATH=/usr/share/qgis/python:/usr/share/qgis/python/plugins
ENV QGIS_LOGFILE=/qgis/qgis.log
ENV QGIS_PROCESSING_LOGFILE=/root/.qgis2/processing/processing.log
ENV QGIS_WORKSPACE=/workspace
ENV QGIS_MODELFILE=/workspace/models/*.model
ENV QGIS_MODELSCRIPT=/workspace/model.py
ENV QGIS_SCRIPTFILE=/workspace/scripts/*.py
ENV QGIS_RESULT=/results
ENV QGIS_USER_MODELDIR=/root/.qgis2/processing/models
ENV QGIS_USER_SCRIPTDIR=/root/.qgis2/processing/scripts
ENV XVFB_LOGFILE=/qgis/xvfb.log

# Copy the current directory contents into the container at /workspace
COPY . /workspace 

# Add main script
WORKDIR /qgis
COPY model.sh model.sh
RUN chmod 0755 model.sh


ENTRYPOINT ["/bin/bash", "/qgis/model.sh"]
