#!/bin/bash

# Function to convert a string to lowercase
lowercase(){
    echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/"
}

DOWNLOAD_CHANNEL="release"
OS=`lowercase \`uname -s\``
MACH=`uname -m`

# Install Domoticz in the $DOMOTICZ_DIR directory
wget -q -O /tmp/domoticz_release.tgz "https://www.domoticz.com/download.php?channel=${DOWNLOAD_CHANNEL}&type=release&system=${OS}&machine=${MACH}"

mkdir -p $DOMOTICZ_DIR
tar -xzf /tmp/domoticz_release.tgz -C $DOMOTICZ_DIR
rm /tmp/domoticz_release.tgz

# Remove plugins that are not needed
rm -rf $DOMOTICZ_DIR/plugins/AwoxSMP $DOMOTICZ_DIR/plugins/examples
