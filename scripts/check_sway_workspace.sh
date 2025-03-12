#!/bin/bash

# Проверяем количество окон в плиточном режиме
WINDOWS=$(swaymsg -t get_tree | jq -r '
  .. |
  select(.type? == "workspace") |
  select(.focused == true) |
  .nodes[] |
  select(.type == "con" and (.layout == "splith" or .layout == "splitv")) |
  .nodes |
  length
')

if [[ "$WINDOWS" -eq 1 ]]; then
  echo "Единственное окно в плиточном режиме."
else
  echo "Больше одного окна или нет плиточного режима."
fi
