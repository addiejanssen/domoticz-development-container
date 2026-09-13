#!/bin/bash

# Install Domoticz in the $DOMOTICZ_DIR directory
wget -q -O /tmp/domoticz_release.tgz "https://www.domoticz.com/download.php?channel=release&type=release&system=linux&machine=x86_64"
mkdir -p $DOMOTICZ_DIR
tar -xzf /tmp/domoticz_release.tgz -C $DOMOTICZ_DIR
rm /tmp/domoticz_release.tgz

# Remove plugins that are not needed
rm -rf $DOMOTICZ_DIR/plugins/AwoxSMP $DOMOTICZ_DIR/plugins/examples
