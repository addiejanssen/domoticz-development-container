#! /bin/bash

# Run domoticz without mDNS, MCP, and updates.
cd $DOMOTICZ_DIR ; ./domoticz -www 8080 -sslwww 0 -nomcp -nomdns -noupdates -log $DOMOTICZ_DIR/domoticz.log -data $DOMOTICZ_DIR
