
#!/bin/bash
export ORDERER_CA=/opt/ws/crypto-config/ordererOrganizations/orderer.net/msp/tlscacerts/tlsca.orderer.net-cert.pem

if [ $# -lt 2 ];then
	echo "Usage : . setpeer.sh CentralGovt|StateGovt|NGO| <peerid>"
fi
export peerId=$2

if [[ $1 = "CentralGovt" ]];then
	echo "Setting to organization CentralGovt peer "$peerId
	export CORE_PEER_ADDRESS=$peerId.CentralGovt.net:7051
	export CORE_PEER_LOCALMSPID=CentralGovtMSP
	export CORE_PEER_TLS_CERT_FILE=/opt/ws/crypto-config/peerOrganizations/CentralGovt.net/peers/$peerId.CentralGovt.net/tls/server.crt
	export CORE_PEER_TLS_KEY_FILE=/opt/ws/crypto-config/peerOrganizations/CentralGovt.net/peers/$peerId.CentralGovt.net/tls/server.key
	export CORE_PEER_TLS_ROOTCERT_FILE=/opt/ws/crypto-config/peerOrganizations/CentralGovt.net/peers/$peerId.CentralGovt.net/tls/ca.crt
	export CORE_PEER_MSPCONFIGPATH=/opt/ws/crypto-config/peerOrganizations/CentralGovt.net/users/Admin@CentralGovt.net/msp
fi

if [[ $1 = "StateGovt" ]];then
	echo "Setting to organization StateGovt peer "$peerId
	export CORE_PEER_ADDRESS=$peerId.StateGovt.net:7051
	export CORE_PEER_LOCALMSPID=StateGovtMSP
	export CORE_PEER_TLS_CERT_FILE=/opt/ws/crypto-config/peerOrganizations/StateGovt.net/peers/$peerId.StateGovt.net/tls/server.crt
	export CORE_PEER_TLS_KEY_FILE=/opt/ws/crypto-config/peerOrganizations/StateGovt.net/peers/$peerId.StateGovt.net/tls/server.key
	export CORE_PEER_TLS_ROOTCERT_FILE=/opt/ws/crypto-config/peerOrganizations/StateGovt.net/peers/$peerId.StateGovt.net/tls/ca.crt
	export CORE_PEER_MSPCONFIGPATH=/opt/ws/crypto-config/peerOrganizations/StateGovt.net/users/Admin@StateGovt.net/msp
fi

if [[ $1 = "NGO" ]];then
	echo "Setting to organization NGO peer "$peerId
	export CORE_PEER_ADDRESS=$peerId.NGO.net:7051
	export CORE_PEER_LOCALMSPID=NGOMSP
	export CORE_PEER_TLS_CERT_FILE=/opt/ws/crypto-config/peerOrganizations/NGO.net/peers/$peerId.NGO.net/tls/server.crt
	export CORE_PEER_TLS_KEY_FILE=/opt/ws/crypto-config/peerOrganizations/NGO.net/peers/$peerId.NGO.net/tls/server.key
	export CORE_PEER_TLS_ROOTCERT_FILE=/opt/ws/crypto-config/peerOrganizations/NGO.net/peers/$peerId.NGO.net/tls/ca.crt
	export CORE_PEER_MSPCONFIGPATH=/opt/ws/crypto-config/peerOrganizations/NGO.net/users/Admin@NGO.net/msp
fi

	