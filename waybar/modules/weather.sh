#!/bin/bash

cachedir=~/.cache/rbn
cachefile=${0##*/}-$1

location=Saint-Petersburg

if [ ! -d $cachedir ]; then
    mkdir -p $cachedir
fi

if [ ! -f $cachedir/$cachefile ]; then
    touch $cachedir/$cachefile
fi

# Save current IFS
SAVEIFS=$IFS
# Change IFS to new line.
IFS=$'\n'

cacheage=$(($(date +%s) - $(stat -c '%Y' "$cachedir/$cachefile")))

if [ $cacheage -gt 1740 ] || [ ! -s $cachedir/$cachefile ]; then
	data=$(curl -s https://ru.wttr.in/$location\?0\&M\&format\=j2)

	echo $data | jq -r '.current_condition[0].FeelsLikeC' > $cachedir/$cachefile
	echo $data | jq -r '.current_condition[0].lang_ru[0].value' >> $cachedir/$cachefile
	echo $data | jq -r '.current_condition[0].temp_C' >> $cachedir/$cachefile
	echo $data | jq -r '.current_condition[0].weatherDesc[0].value' >> $cachedir/$cachefile
	echo $data | jq -r '.current_condition[0].windspeedKmph' >> $cachedir/$cachefile
	echo $data | jq -r '.nearest_area[0].areaName[0].value' >> $cachedir/$cachefile
fi

weather=($(cat $cachedir/$cachefile))

# Restore IFSClear
IFS=$SAVEIFS

temperature=$(echo ${weather[2]} | sed -E 's/([[:digit:]]+)\.\./\1 to /g')

case $(echo ${weather[3]##*,} | tr '[:upper:]' '[:lower:]') in
"clear" | "sunny")
    condition="󰖨"
    ;;
"partly cloudy")
    condition="󰖕"
    ;;
"cloudy")
    condition="󰖐"
    ;;
"overcast")
    condition=""
    ;;
"mist" | "fog" | "freezing fog")
    condition=""
    ;;
"patchy rain possible" | "patchy light drizzle" | "light drizzle" | "patchy light rain" | "light rain" | "light rain shower" | "rain")
    condition=""
    ;;
"moderate rain at times" | "moderate rain" | "heavy rain at times" | "heavy rain" | "moderate or heavy rain shower" | "torrential rain shower" | "rain shower")
    condition=""
    ;;
"patchy freezing drizzle possible" | "freezing drizzle" | "heavy freezing drizzle" | "light freezing rain" | "moderate or heavy freezing rain" | "ice pellets" | "rain and snow shower")
    condition="󰙿"
	;;
"patchy sleet possible" | "light sleet" | "light sleet showers" | "moderate or heavy sleet showers")
    condition="󰙿"
    ;;
"blowing snow" | "moderate or heavy sleet" | "patchy light snow" | "light snow" | "light snow showers | patchy snow possible")
    condition="󰖘"
    ;;
"blizzard" | "patchy moderate snow" | "moderate snow" | "patchy heavy snow" | "heavy snow" | "moderate or heavy snow with thunder" | "moderate or heavy snow showers")
    condition="󰼶"
    ;;
"thundery outbreaks possible" | "patchy light rain with thunder" | "moderate or heavy rain with thunder" | "patchy light snow with thunder")
    condition=""
    ;;
*)
    condition=""
	# echo -e "{\"text\":\""$temperature"°C "$condition"\", \"alt\":\""${weather[0]}"°C\", \"tooltip\":\""${weather[5]}"\n"$temperature"°C\nОщущается как "${weather[0]}"°C\n"${weather[1]}"\nВетер "${weather[4]}"Км/ч\"}"
	echo -e "{\"text\":\""$temperature"°C "$condition"\", \"alt\":\""${weather[0]}"°C\", \"tooltip\":\"\"}"
    ;;
esac

# echo -e "{\"text\":\""$temperature"°C "$condition"\", \"alt\":\""${weather[0]}"°C\", \"tooltip\":\""${weather[5]}"\n"$temperature"°C\nОщущается как "${weather[0]}"°C\n"${weather[1]}"\nВетер "${weather[4]}"Км/ч\"}"
echo -e "{\"text\":\""$temperature"°C "$condition"\", \"alt\":\""${weather[0]}"°C\", \"tooltip\":\"\"}"
