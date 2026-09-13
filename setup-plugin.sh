#! /bin/bash

mkdir -p $DOMOTICZ_DIR/plugins/solaredge-modbustcp

git clone git@github.com:addiejanssen/domoticz-solaredge-modbustcp-plugin.git $DOMOTICZ_DIR/plugins/solaredge-modbustcp

# Use this if you want to use https instead of ssh:
# git clone https://github.com/addiejanssen/domoticz-solaredge-modbustcp-plugin.git $DOMOTICZ_DIR/plugins/solaredge-modbustcp

# Install dependencies
pip3 install -r $DOMOTICZ_DIR/plugins/solaredge-modbustcp/requirements.txt
