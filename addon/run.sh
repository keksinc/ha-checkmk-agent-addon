#!/usr/bin/with-contenv bashio

#/bin/check_mk_agent


jsonCore=$(curl -sSL -H "Authorization: Bearer $SUPERVISOR_TOKEN" http://supervisor/core/info)
jsonOs=$(curl -sSL -H "Authorization: Bearer $SUPERVISOR_TOKEN" http://supervisor/os/info)
jsonHost=$(curl -sSL -H "Authorization: Bearer $SUPERVISOR_TOKEN" http://supervisor/host/info)

echo $jsonHost | jq

echo "$jsonCore" | jq -r ".data.version"
echo "$jsonCore" | jq -r ".data.version_latest"

echo "Starting socat"
/usr/bin/socat -U TCP-LISTEN:6556,fork,reuseaddr EXEC:/bin/check_mk_agent


