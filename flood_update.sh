#!/bin/bash
if [[ ! -z "$1" ]]; then  
	. setpeer.sh CentralGovt peer0 
export CHANNEL_NAME="floodchannel"
	peer chaincode install -n flood -v $1 -p github.com/flood
	. setpeer.sh StateGovt peer0 
export CHANNEL_NAME="floodchannel"
	peer chaincode install -n flood -v $1 -p github.com/flood
	. setpeer.sh NGO peer0 
export CHANNEL_NAME="floodchannel"
	peer chaincode install -n flood -v $1 -p github.com/flood
	peer chaincode upgrade -o orderer.orderer.net:7050 --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA -C floodchannel -n flood -v $1 -c '{"Args":["init",""]}' -P " OR( 'CentralGovtMSP.member','StateGovtMSP.member','NGOMSP.member' ) " 
else
	echo ". flood_updchain.sh  <Version Number>" 
fi
