#!/bin/bash

IP="10.124.163.90"
USER="admin"
PASS="Admin32!"
pre="gnmic --mode ONCE -a $IP:9339 -u $USER -p $PASS subscribe -e json_ietf --skip-verify"
temp="${pre}"
idx=1

declare -a StringArray=(
    # LOGGING PREDEFINED
    "--path pan/config/full_config[data_push_url=http://10.124.141.41:8080/running-config_full_panorama.xml]"
    "--path pan/config/delta_config[data_push_url=http://10.124.141.41:8080/running-config_delta_panorama.xml]"
  )

while [ $idx -gt 0 ];
do
    counter=0
    for val in "${StringArray[@]}"; do
        temp="${pre}"
        ((counter++))
        ###temp="${temp} ${path_temp}${i}"
        temp="${temp} ${val}"

        echo ""
        echo "====================================================================================================================================================================================="
        echo "Executing"
        echo "$temp"
        # eval
        $temp
        echo "After execution of command #$counter"
        echo "====================================================================================================================================================================================="
        echo ""
        echo "Loop Index : #$idx"
        sleep 10
    done
    idx=$((idx+1))
done
