#!/usr/bin/with-contenv bashio

#/bin/check_mk_agent

#/usr/bin/ha core info --raw-json | jq -r ".data.version"
#/usr/bin/ha core info --raw-json | jq -r ".data.version_latest"
curl -sSL -H "Authorization: Bearer $SUPERVISOR_TOKEN" http://10.0.0.179/core/info
curl -sSL -H "Authorization: Bearer $SUPERVISOR_TOKEN" http://10.0.0.179/os/info
echo ""

echo token: $SUPERVISOR_TOKEN
ping supervisor -c3
echo "Starting socat"
/usr/bin/socat -U TCP-LISTEN:6556,fork,reuseaddr EXEC:/bin/check_mk_agent


