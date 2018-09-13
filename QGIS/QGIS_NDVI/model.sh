# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0

# Print out QGIS 
echo "### model.sh ### Installed software versions:"
python -c 'import qgis.utils; print "QGIS: %s" % qgis.utils.QGis.QGIS_VERSION'
echo "QGIS processing plugin:" $(
cat /usr/share/qgis/python/plugins/processing/metadata.txt | grep "version")
python --version
#saga_cmd --version --version 2>&1 | head -1
echo "Orfeo Toolbox (OTB) 5.6.1-Linux64"

echo " "
# We expect the container is started with one model file configured via environment variable
mkdir -p $QGIS_USER_MODELDIR
echo "### model.sh ### Using QGIS model file" $(ls $QGIS_MODELFILE)
cp $QGIS_MODELFILE $QGIS_USER_MODELDIR/docker.model
echo "### model.sh ### Model files is directory" $QGIS_USER_MODELDIR":" $(ls $QGIS_USER_MODELDIR)

#echo " "
#echo "### model.sh ### environment:"
#printenv

# We expect the container is started with script files configured via environment variable
mkdir -p $QGIS_USER_SCRIPTDIR
if [ -f $QGIS_SCRIPTFILE ]; then
    cp $QGIS_SCRIPTFILE $QGIS_USER_SCRIPTDIR
    echo "### model.sh ### Script files directory contents" $QGIS_USER_SCRIPTDIR":" $(ls $QGIS_USER_SCRIPTDIR)
fi

# Run QGIS headless, see https://marc.info/?l=qgis-developer&m=141824118828451&w=2 using X Window Virtual Framebuffer
# We except the actual model file to be configured via environment variable
echo " "
echo "### model.sh ### Running model now"
xvfb-run -e $XVFB_LOGFILE python $QGIS_MODELSCRIPT

echo " "
echo "### model.sh ### QGIS processing log:"
cat $QGIS_PROCESSING_LOGFILE

echo " "
echo "### model.sh ### QGIS log:"
cat $QGIS_LOGFILE

echo " "
echo "### model.sh ### Workspace directory contents:"
tree /workspace
