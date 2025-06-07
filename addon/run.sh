#!/usr/bin/with-contenv bashio

/bin/check_mk_agent

ha core info --raw-json | jq -r ".data.version"
ha core info --raw-json | jq -r ".data.version_latest"



echo "Starting socat"
/usr/bin/socat -U TCP-LISTEN:6556,fork,reuseaddr EXEC:/bin/check_mk_agent


