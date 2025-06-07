#!/usr/bin/with-contenv bashio

echo "Starting socat"
/usr/bin/socat -U TCP-LISTEN:6556,fork,reuseaddr EXEC:/bin/check_mk_agent


