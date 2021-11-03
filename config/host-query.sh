#!/bin/bash

script_dir=$(cd $(dirname $0); pwd)
consul_dir=$script_dir/../../consul

export AREA=qz
export CONSUL=192.168.3.3:8500
export TYPE=FIL

# gc host need Manual update
areas="qz nm ya"
for area in $areas ;
do
    ./host-query.py  $CONSUL $area-chia                > $area-chia/$area-chia
    ./host-query.py  $CONSUL $area-FIC-Miner           > $area-fic-miner/$area-FIC-Miner
    #./consul-svr-query.py  $CONSUL $area-FIC-Miner-DCGM      > $area-fic-miner/$area-FIC-Miner-DCGM
    ./host-query.py  $CONSUL $area-FIC-Worker          > $area-fic-worker/$area-FIC-Worker
    #./consul-svr-query.py  $CONSUL $area-FIC-Worker-DCGM     > $area-fic-worker/$area-FIC-Worker-DCGM
    ./host-query.py  $CONSUL $area-FIL-Miner           > $area-fil-miner/$area-FIL-Miner
    #./consul-svr-query.py  $CONSUL $area-FIL-Miner-DCGM      > $area-fil-miner/$area-FIL-Miner-DCGM
    ./host-query.py  $CONSUL $area-FIL-Worker          > $area-fil-worker/$area-FIL-Worker
    #./consul-svr-query.py  $CONSUL $area-FIL-Worker-DCGM     > $area-fil-worker/$area-FIL-Worker-DCGM
done
