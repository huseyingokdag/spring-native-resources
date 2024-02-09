#!/bin/bash
PORT=8080

if [[ $1 = "jvm" ]]
then
    export PLOT_NAME="jvm"
    java -jar ./bin/demo-0.0.1-SNAPSHOT.jar &
elif [[ $1 = "native-opt" ]]
then
    export PLOT_NAME="native-opt"
    ./bin/demo_optimized &
else
    export PLOT_NAME="native"
    ./bin/demo_default &
fi

export PERF_PID=$!
#echo $PERF_PID

STAT_FILE_NAME=$PLOT_NAME-$(date +%s)

~/Library/Python/3.9/bin/psrecord $PERF_PID --log log-$STAT_FILE_NAME.log --plot plot-$STAT_FILE_NAME.png --include-children &

while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' http://localhost:$PORT/demo/hello)" != "200" ]]; 
    do sleep .001;
done

hey -n 1000000 http://localhost:$PORT/demo/hello > ../docs/benchmark-logs/throughput-$STAT_FILE_NAME.txt
# hey -n 100 -o csv http://localhost:$PORT/demo/hello > throughput-$STAT_FILE_NAME.csv

kill $PERF_PID