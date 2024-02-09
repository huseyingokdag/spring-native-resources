#!/bin/bash
for i in $(seq 3)
do
    ./timeToFirstResponse.sh "jvm"
    sleep 15
done

sleep 60

for i in $(seq 3)
do
    ./timeToFirstResponse.sh "native-opt"
    sleep 15
done

sleep 60

for i in $(seq 3)
do
    ./timeToFirstResponse.sh
    sleep 15
done