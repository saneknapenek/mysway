#!/bin/bash

output_devices=$(wpctl status | awk '/^ ├─ Sinks:/{flag=1; next} /^ ├─ Sources:/{flag=0} flag && NF {print $2, $3, $4, $5}')

if [ -z "$output_devices" ]; then
    echo "Нет доступных устройств вывода"
    exit 1
fi

selected_device=$(echo "$output_devices" | rofi -dmenu -config ~/.config/rofi/audio_sinks/config.rasi)

if [ -n "$selected_device" ]; then
    wpctl set-default "$selected_device"
    notify-send "Устройство вывода установлено на: $selected_device"
else
    echo "Выбор устройства отменен."
fi

