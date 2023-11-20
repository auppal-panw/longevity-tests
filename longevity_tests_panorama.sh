#!/bin/bash

IP="10.124.163.90"
USER="admin"
PASS="Admin32!"
pre="gnmic --mode ONCE -a $IP:9339 -u $USER -p $PASS subscribe -e json_ietf --skip-verify"
temp="${pre}"
idx=1

declare -a StringArray=(
    # LOGGING PREDEFINED
    " --path /pan/logging/query/predefined/percentage_of_traffic_that_is_one_way_or_asymmetric"
    " --path /pan/logging/query/predefined/system_logs_vpn_and_dpd_15_min"
    " --path /pan/logging/query/predefined/system_log"
    " --path /pan/logging/query/predefined/percentage_of_traffic_that_is_one_way_or_asymmetric"
    " --path /pan/logging/query/predefined/raven_and_DNS_signature_threat_logs"
    " --path /pan/logging/query/predefined/PAN_DNS_related_logs"
    " --path /pan/logging/query/predefined/config_log"
    " --path /pan/logging/query/predefined/percentage_of_SaaS_applications_that_has_malware"
    " --path /pan/logging/query/predefined/URL_malware_blocks"
    " --path /pan/logging/query/predefined/URL_C2_blocks"
    " --path /pan/logging/query/predefined/URL_phishing_blocks"
    " --path /pan/logging/query/predefined/wildfire_detections"
    " --path /pan/logging/query/predefined/credential_theft"
    " --path /pan/logging/query/predefined/threats_permitted"
    " --path /pan/logging/query/predefined/system_logs_vpn_and_dpd_5_min"
    " --path /pan/logging/query/predefined/corr_object_events"
    " --path /pan/logging/query/predefined/corr_detailed_telemetry"

    # REPORTING PREDEFINED
    " --path /pan/reporting/query/predefined/top_application_usage"
    " --path /pan/reporting/query/predefined/unknown_applications_by_destination_ports"
    " --path /pan/reporting/query/predefined/unknown_applications_by_destination_addresses"
    " --path /pan/reporting/query/predefined/file_identification"
    " --path /pan/reporting/query/predefined/attackers"
    " --path /pan/reporting/query/predefined/attacking_countries"
    " --path /pan/reporting/query/predefined/top_threatid"
    " --path /pan/reporting/query/predefined/parked_domains_categories_by_url"
    " --path /pan/reporting/query/predefined/dynamic_dns_categories_by_url"
    " --path /pan/reporting/query/predefined/proxy_avoidance_categories_by_url"
    " --path /pan/reporting/query/predefined/unknown_categories_by_url"
    " --path /pan/reporting/query/predefined/questionable_categories_by_url"
    " --path /pan/reporting/query/predefined/phishing_categories_by_url"
    " --path /pan/reporting/query/predefined/malware_categories_by_url"
    " --path /pan/reporting/query/predefined/urlstat"
    " --path /pan/reporting/query/predefined/Non_standard_ports"
    " --path /pan/reporting/query/predefined/GlobalProtect_endpoint_OS_aggregates"
    " --path /pan/reporting/query/predefined/GlobalProtect_gateway_connection_details_connected"
    " --path /pan/reporting/query/predefined/GlobalProtect_gateway_connection_details"
    " --path /pan/reporting/query/predefined/GlobalProtect_connection_failure_details"
    " --path /pan/reporting/query/predefined/GlobalProtect_connection_performance_details"
  )

while [ $idx -gt 0 ];
do
    counter = 0
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
