#!/bin/bash
for i in $(seq 3)
do
    ./load.sh "jvm"
    sleep 10
done

sleep 60

for i in $(seq 3)
do
    ./load.sh "native-opt"
    sleep 10
done

sleep 60

for i in $(seq 3)
do
    ./load.sh
    sleep 10
done