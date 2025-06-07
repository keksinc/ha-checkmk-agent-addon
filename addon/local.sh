


coreVersion=$(ha core info --raw-json | jq -r ".data.version")
coreLatestVersion=$(ha core info --raw-json | jq -r ".data.version_latest")
[ "$coreVersion" = "$coreLatestVersion" ] && status=0 || status=1
echo $status \"HA Core version\" - $coreVersion - Latest: $coreLatestVersion

osVersion=$(ha os info --raw-json | jq -r ".data.version")
osLatestVersion=$(ha os info --raw-json | jq -r ".data.version_latest")
[ "$osVersion" = "$osLatestVersion" ] && status=0 || status=1
echo $status \"HA OS version\" - $osVersion - Latest: $osLatestVersion

# echo 0 \"My service\" myvalue=73 My output text which may contain spaces

