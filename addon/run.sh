#!/usr/bin/with-contenv bashio

#/bin/check_mk_agent


jsonCore=$(curl -sSL -H "Authorization: Bearer $SUPERVISOR_TOKEN" http://supervisor/core/info)
jsonOs=$(curl -sSL -H "Authorization: Bearer $SUPERVISOR_TOKEN" http://supervisor/os/info)

jq -r ".data.version" "$jsonCore"
jq -r ".data.version_latest" "$jsonCore"

echo "Starting socat"
/usr/bin/socat -U TCP-LISTEN:6556,fork,reuseaddr EXEC:/bin/check_mk_agent


