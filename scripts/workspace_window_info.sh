#!/bin/bash

# Интервал обновления (в секундах)
UPDATE_INTERVAL=2

# Путь к файлу, где будет храниться информация
OUTPUT_FILE="/tmp/workspace_windows.json"

# Функция для получения текущего рабочего пространства
get_current_workspace() {
    swaymsg -t get_workspaces | jq -r '.[] | select(.focused == true).name'
}

get_windows_info() {
    local workspace=$1

    swaymsg -t get_tree | jq -r "
        .. |
        select(.type? == \"workspace\" and .name == \"$workspace\") |
        .nodes[], .floating_nodes[] |
        {
            name: .name,
            pid: .pid,
            app_id: .app_id,
            layout: if .layout then .layout else \"floating\" end
        }
    "
}

parse_tree() {
    local data="$1"
    local current_output=""
    local current_workspace=""
    local current_con=""

    # Разбираем данные
    while IFS= read -r line; do
        if [[ "$line" =~ #([0-9]+):\ (root|output|workspace|con)\ \"([^\"]+)\" ]]; then
            local id="${BASH_REMATCH[1]}"
            local type="${BASH_REMATCH[2]}"
            local value="${BASH_REMATCH[3]}"

            case "$type" in
                root)
                    echo "Root: $value"
                    ;;
                output)
                    current_output="$value"
                    echo "Output: $current_output"
                    ;;
                workspace)
                    current_workspace="$value"
                    echo "  Workspace: $current_workspace"
                    ;;
                con)
                    current_con="$value"
                    echo "    Con: $current_con"
                    ;;
            esac
        fi
    done <<< "$data"
}

# Основной цикл
while true; do
    # current_workspace=$(get_current_workspace)
    # echo "Текущее рабочее пространство: $current_workspace"
    #
    # if [[ -n "$current_workspace" ]]; then
    #     windows_info=$(get_windows_info "$current_workspace")
    #     echo "$windows_info" | jq -s '.' > "$OUTPUT_FILE"
    #     echo "Обновлена информация об окнах: $OUTPUT_FILE"
    # else
    #     echo "Не удалось определить текущее рабочее пространство."
    # fi
	
	data=$(parse_info)
	
	echo "$data"

    sleep "$UPDATE_INTERVAL"
done
