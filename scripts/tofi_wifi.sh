#!/bin/bash

DEVICE=${1:-wlan0}
CONFIG="/home/san/repo/mysway/tofi/wifi.ini"

iwctl station $DEVICE scan

CURR_SSID=$(iwctl station $DEVICE show | sed -n 's/^\s*Connected\snetwork\s*\(\S*\)\s*$/\1/p')
IW_NETWORKS+=$(iwctl station $DEVICE get-networks | sed '/^--/d')
IW_NETWORKS=$(echo "$IW_NETWORKS" | sed 1,4d)
IW_NETWORKS=$(echo "$IW_NETWORKS" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g")
IFS=$'\n'
PREFIX='> '
NETWORK_LIST=""
while IFS= read -r line; do
	line=${line:6}
	SSID_NAME=$(echo "$line" | sed 's/\(\s*psk.*\)//')
	printf -v pad %36s
	line=$SSID_NAME$pad
	line=${line:0:36}
	line+=$'PSK'
	line+=$'\n'
	if [ "$SSID_NAME" = "$CURR_SSID" ]; then
		PREFIX+=$line
	else
		NETWORK_LIST+="  "
		NETWORK_LIST+=$line
	fi
done <<< "$IW_NETWORKS"
if [[ -n $CURR_SSID ]]; then
	IW_NETWORKS=$(echo "$PREFIX$NETWORK_LIST" | sed '$d')
else
	IW_NETWORKS=$(echo "$NETWORK_LIST" | sed '$d')
fi


CHENTRY=$(echo -e "$IW_NETWORKS" | uniq -u | echo -e "$IW_NETWORKS" | uniq -u | tofi --placeholder-text "  SSID                                SECURITY" --prompt-text "   " --num-results 0 --config $CONFIG)
CHSSID=$(echo "$CHENTRY" | sed 's/PSK//g' | xargs)
if [[ $(echo "$CHSSID" | awk '{print $1}') = ">" ]]; then
	CHSSID=$(echo "$CHENTRY" | sed 's/PSK//g' | xargs | cut -c 3-)
fi


if [[ $CHSSID = $CURR_SSID ]]; then
	iwctl station $DEVICE disconnect
elif [ "$CHSSID" != "" ]; then
	WIFI_PASS=$(echo "" | tofi --config $CONFIG --height 100 --width 500 --hide-input true --hidden-character "*" --require-match false --prompt-text "Password: " --num-results 1)
	iwctl station $DEVICE disconnect
	if [[ -n $WIFI_PASS ]]; then
		iwctl --passphrase $WIFI_PASS station $DEVICE connect $CHSSID
	else
		iwctl station $DEVICE connect $CHSSID
	fi
fi