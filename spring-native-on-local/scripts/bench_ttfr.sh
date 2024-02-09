#!/bin/bash
PORT=8080

start_time=$(gdate +%s.%3N)

if [[ $1 = "jvm" ]]
then
    export PLOT_NAME="jvm"
    java -jar ./bin/demo-0.0.1-SNAPSHOT.jar > /dev/null 2>&1 &
elif [[ $1 = "native-opt" ]]
then
    export PLOT_NAME="native-opt"
    ./bin/demo_optimized > /dev/null 2>&1 &
else
    export PLOT_NAME="native"
    ./bin/demo_default > /dev/null 2>&1 &
fi

export PERF_PID=$!
#echo $PERF_PID

#echo "Wait until application successfully replies to the first request on port $PORT ..."

while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' http://localhost:$PORT/demo/hello)" != "200" ]]; 
    do sleep .00001; 
done

end_time=$(gdate +%s.%3N)

elapsed=$(echo "scale=3; $end_time - $start_time" | bc)
echo "Elapsed time for : " $PLOT_NAME $elapsed" ms"

kill $PERF_PID