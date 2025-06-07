

jsonCore=$(curl -sSL -H "Authorization: Bearer $SUPERVISOR_TOKEN" http://supervisor/core/info)
jsonOs=$(curl -sSL -H "Authorization: Bearer $SUPERVISOR_TOKEN" http://supervisor/os/info)
jsonHost=$(curl -sSL -H "Authorization: Bearer $SUPERVISOR_TOKEN" http://supervisor/host/info)


coreVersion=$(echo "$jsonCore" | jq -r ".data.version")
coreLatestVersion=$(echo "$jsonCore" | jq -r ".data.version_latest")
[ "$coreVersion" = "$coreLatestVersion" ] && status=0 || status=1
echo $status \"HA Core version\" - $coreVersion - Latest: $coreLatestVersion

osVersion=$(echo "$jsonOs" | jq -r ".data.version")
osLatestVersion=$(echo "$jsonOs" | jq -r ".data.version_latest")
[ "$osVersion" = "$osLatestVersion" ] && status=0 || status=1
echo $status \"HA OS version\" - $osVersion - Latest: $osLatestVersion

hostDiskUsed=$(echo "$jsonHost" | jq -r ".data.disk_used")
hostDiskTotal=$(echo "$jsonHost" | jq -r ".data.disk_total")

usagePercent=$(printf "%.2f" $(echo "100*$hostDiskUsed/$hostDiskTotal" | bc -l))

echo P \"Disk Usage\" usage="$usagePercent;70;90;0;100" Current usage: $usagePercent


# echo 0 \"My service\" myvalue=73 My output text which may contain spaces

