#!/bin/bash
cd /etc/init.d

echo '[Start Lock Server]'
nohup ./totvslockserver start &
sleep 5

echo '[Start License Server]'
nohup ./totvslicense start &
sleep 2

echo '[Start DBAccess Server]'
nohup ./totvsdbaccess start
sleep 2

echo '[Start Broker Server]'
cd /totvs/bin/appserver/broker
nohup ./app_broker -balance_smart_client_desktop -a &

cd /etc/init.d

echo '[Start Slave01]'
nohup ./totvslave01 start &

echo '[Start Slave02]'
nohup ./totvslave02 start &

echo '[Start Soap]'
nohup ./totvssoap start &

echo '[Start Rest]'
nohup ./totvsrest start &
