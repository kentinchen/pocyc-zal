#!/bin/bash

script_dir=$(cd $(dirname $0); pwd)
cd $script_dir

areas="qz nm ya gc"
for area in $areas ;
do
    readarray -d $'\0' -t a < <(kubectl get cm -l prometheus-name=$area -o json -n paf| jq -cj '.items[] | . as $cm | .data | to_entries[] | [ ($cm.metadata.name + "-" + .key), .value ][]+"\u0000"') ; count=0; while [ $count -lt ${#a[@]} ]; do echo "${a[$((count + 1))]}" > ${a[$count]}; count=$(( $count + 2)); done
    mkdir -p $area-chia       && mv prometheus-$area-rulefiles-0-paf-rule-chia.yaml           $area-chia/
    mkdir -p $area-fic-miner  && mv prometheus-$area-rulefiles-0-paf-rule-fic.yaml            $area-fic-miner/
    mkdir -p $area-fic-miner  && mv prometheus-$area-rulefiles-0-paf-rule-fic-miner.yaml      $area-fic-miner/
    mkdir -p $area-fic-worker && mv prometheus-$area-rulefiles-0-paf-rule-fic-work.yaml       $area-fic-worker/
    mkdir -p $area-fil-miner  && mv prometheus-$area-rulefiles-0-paf-rule-fil-miner.yaml      $area-fil-miner/
    mkdir -p $area-fil-worker && mv prometheus-$area-rulefiles-0-paf-rule-fil-work.yaml       $area-fil-worker/
done
