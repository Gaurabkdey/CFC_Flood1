
#!/bin/bash -e




echo "Building channel for floodchannel" 

. setpeer.sh CentralGovt peer0
export CHANNEL_NAME="floodchannel"
peer channel create -o orderer.orderer.net:7050 -c $CHANNEL_NAME -f ./floodchannel.tx --tls true --cafile $ORDERER_CA -t 10000


. setpeer.sh CentralGovt peer0
export CHANNEL_NAME="floodchannel"
peer channel join -b $CHANNEL_NAME.block


. setpeer.sh StateGovt peer0
export CHANNEL_NAME="floodchannel"
peer channel join -b $CHANNEL_NAME.block


. setpeer.sh NGO peer0
export CHANNEL_NAME="floodchannel"
peer channel join -b $CHANNEL_NAME.block

