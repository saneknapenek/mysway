#!/bin/bash

# Функция для получения текущего рабочего пространства
get_current_workspace() {
    swaymsg -t get_workspaces | jq -r '.[] | select(.focused == true).name'
}

# Функция для мониторинга окон в текущем рабочем пространстве
monitor_windows_in_workspace() {
    local workspace=$1

    echo "Начат мониторинг окон для рабочего пространства: $workspace"

    # Подписка на события окон
    swaymsg -t subscribe '[ "window" ]' | while read -r event; do
        # Проверяем, что событие относится к текущему рабочему пространству
        current_workspace=$(get_current_workspace)

        if [[ "$current_workspace" == "$workspace" ]]; then
            # Обработка события окна
            event_type=$(echo "$event" | jq -r '.change')
            window_name=$(echo "$event" | jq -r '.container.name // "unknown"')

            echo "Событие: $event_type, Окно: $window_name"

            case $event_type in
                "new")
                    echo "Открыто новое окно: $window_name"
                    ;;
                "close")
                    echo "Закрыто окно: $window_name"
                    ;;
                "floating")
                    echo "Окно переключено в плавающий режим: $window_name"
                    ;;
                "fullscreen_mode")
                    echo "Окно переключено в полноэкранный режим: $window_name"
                    ;;
                *)
                    echo "Другое событие: $event_type"
                    ;;
            esac
        fi
    done
}

# Основной цикл
while true; do
    # Получаем номер текущего рабочего пространства
    current_workspace=$(get_current_workspace)
    echo "Текущее рабочее пространство: $current_workspace"

    # Запускаем мониторинг окон для текущего рабочего пространства
    monitor_windows_in_workspace "$current_workspace" &

    # Проверяем изменения каждые 2 секунды
    sleep 2
done
