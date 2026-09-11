#!/bin/bash

wget -q -O /tmp/domoticz_release.tgz "https://www.domoticz.com/download.php?channel=release&type=release&system=linux&machine=x86_64"
mkdir -p /workspaces/domo-dev/domoticz
tar -xzf /tmp/domoticz_release.tgz -C domoticz
rm /tmp/domoticz_release.tgz
