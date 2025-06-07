

jsonCore=$(curl -sSL -H "Authorization: Bearer $SUPERVISOR_TOKEN" http://supervisor/core/info)
jsonOs=$(curl -sSL -H "Authorization: Bearer $SUPERVISOR_TOKEN" http://supervisor/os/info)


coreVersion=$(jq -r ".data.version" "$jsonCore")
coreLatestVersion=$(jq -r ".data.version_latest" "$jsonCore")
[ "$coreVersion" = "$coreLatestVersion" ] && status=0 || status=1
echo $status \"HA Core version\" - $coreVersion - Latest: $coreLatestVersion

osVersion=$(jq -r ".data.version" "$jsonOs")
osLatestVersion=$(jq -r ".data.version_latest" "$jsonOs")
[ "$osVersion" = "$osLatestVersion" ] && status=0 || status=1
echo $status \"HA OS version\" - $osVersion - Latest: $osLatestVersion

# echo 0 \"My service\" myvalue=73 My output text which may contain spaces

