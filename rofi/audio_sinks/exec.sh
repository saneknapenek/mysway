#!/bin/bash

output_devices=$(wpctl status | sed -n '/^ ├─ Sinks:/,/^ ├─ Sources:/p' | awk '/[0-9]+\./ {print $2, substr($0, index($0,$3))}')

if [ -z "$output_devices" ]; then
    notify-send "Нет доступных устройств вывода"
    exit 1
fi

num_lines=$(echo "$output_devices" | wc -l)
num_lines=$(( num_lines > 6 ? 6 : num_lines ))

selected_device=$(echo "$output_devices" | rofi -dmenu -l $num_lines -config ~/.config/rofi/audio_sinks/config.rasi)

if [ -n "$selected_device" ]; then
    wpctl set-default "$selected_device"
    notify-send "Устройство вывода установлено на: $selected_device"
fi

