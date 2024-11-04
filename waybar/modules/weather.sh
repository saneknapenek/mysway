#!/bin/bash


area=Санкт-Петербург
response=$(curl -s "https://ru.wttr.in/$area?0&M&format=%c+%t+%f+%w+%C\n")

icon=$(echo "$response" | awk '{print $1}')
temp_current=$(echo "$response" | awk '{print $2}')
temp_feels=$(echo "$response" | awk '{print $3}')
wind_speed=$(echo "$response" | awk '{print $4}')
description=$(echo "$response" | awk '{for (i=5; i<=NF; i++) printf "%s ", $i; print ""}')

description=$(echo "$description" | xargs)

case "$icon" in
    "☁️") icon="󰖐" ;;
    "🌫") icon="󰖑" ;;
    "🌧") icon="󰖗" ;;
    "❄️") icon="󰼶" ;;
    "🌦") icon="󰼳" ;;
    "🌨") icon="󰖘" ;;
    "⛅️") icon="󰖕" ;;
    "☀️") icon="󰖙" ;;
    "🌩") icon="󰖓" ;;
    "⛈") icon="󰙾" ;;
    *) icon="" ;;
esac

echo -e "{\"text\":\""$temp_current" "$icon"\", \"alt\":\""$temp_feels"\", \"tooltip\":\""$area"  "$temp_current"\r"$description"\rОщущается как  "$temp_feels"\rВетер "$wind_speed"\"}"
