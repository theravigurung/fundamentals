#!/bin/sh
# Generate N thread dumps of the process PID with an INTERVAL between each dump.
if [ $# -ne 3 ]; then
   echo Generates Java thread dumps using the jstack command.
   echo
   echo usage: $0 process_id repetitions interval
   exit 1
fi
PID=$1
N=$2
INTERVAL=$3
for ((i=1;i<=$N;i++))
do
   d=$(date +%Y%m%d-%H%M%S)
   dump="threaddump-$PID-$d.txt"
   echo $i of $N: $dump
   jstack -l $PID > $dump
   sleep $INTERVAL
done
