# #!/bin/bash
#
# # Бесконечный цикл для обработки событий
# while true; do
#     # Подписка на события переключения рабочих пространств
#     swaymsg -t subscribe '[ "workspace" ]' | while read -r event; do
#         # Извлечение имени текущего рабочего пространства
#         current_workspace=$(echo "$event" | jq -r 'select(.change == "focus").current.name')
#
#         # Если имя рабочего пространства найдено, выполняем действие
#         if [[ -n "$current_workspace" ]]; then
#             echo "Переключено на рабочее пространство: $current_workspace"
#
# 			swaymsg -t get_tree | jq -r "
#                 .. |
#                 select(.type? == \"workspace\" and .name == \"$current_workspace\") |
#                 .nodes[] | 
#                 {
#                     name: .name,
#                     pid: .pid,
#                     app_id: .app_id,
#                     layout: .layout,
#                     floating: .floating_nodes | length
#                 }"
#
#             # Здесь можно выполнить ваш скрипт
#             /path/to/your/script.sh "$current_workspace"
#         fi
#     done
# done

#!/bin/bash

# Функция обработки событий окон
monitor_windows() {
    local workspace_name=$1

    echo "Подписка на события окон для рабочего пространства: $workspace_name"

    swaymsg -t subscribe '[ "window" ]' | while read -r event; do
        # Проверяем, относится ли событие к текущему рабочему пространству
        related_workspace=$(swaymsg -t get_tree | jq -r "
            .. |
            select(.type? == \"workspace\" and .focused == true).name
        ")

        if [[ "$related_workspace" == "$workspace_name" ]]; then
            # Извлекаем тип события и окно
            event_type=$(echo "$event" | jq -r '.change')
            window_name=$(echo "$event" | jq -r '.container.name // "unknown"')

            echo "Событие: $event_type, Окно: $window_name"

            # Обрабатывайте события по необходимости
            if [[ "$event_type" == "new" ]]; then
                echo "Открыто новое окно: $window_name"
            elif [[ "$event_type" == "close" ]]; then
                echo "Закрыто окно: $window_name"
            elif [[ "$event_type" == "floating" ]]; then
                echo "Окно переключено в плавающий режим: $window_name"
            elif [[ "$event_type" == "fullscreen_mode" ]]; then
                echo "Окно перешло в полноэкранный режим: $window_name"
            fi
        fi
    done
}

# Подписка на события переключения рабочих пространств
swaymsg -t subscribe '[ "workspace" ]' | while read -r event; do
    current_workspace=$(echo "$event" | jq -r 'select(.change == "focus").current.name')

    if [[ -n "$current_workspace" ]]; then
        echo "Переключено на рабочее пространство: $current_workspace"

        # Запускаем мониторинг окон для текущего рабочего пространства
        monitor_windows "$current_workspace" &
    fi
done

