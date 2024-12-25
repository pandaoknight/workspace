#!/usr/bin/bash

# 定义颜色和样式代码
RESET="\e[0m"

# 格式
STYLES=("\e[0m" "\e[1m" "\e[2m" "\e[4m")

# 常规颜色
COLORS=("\e[30m" "\e[31m" "\e[32m" "\e[33m" "\e[34m" "\e[35m" "\e[36m" "\e[37m")

# 256色模式
COLORS+=("\e[38;5;208m" "\e[38;5;93m" "\e[38;5;13m")

# 样式名称
STYLE_NAMES=("Normal" "Bold" "Dim" "Underlined")

# 颜色名称
COLOR_NAMES=("Black" "Red" "Green" "Yellow" "Blue" "Magenta" "Cyan" "White" "Orange" "Purple" "Pink")

# 显示颜色和样式
for i in "${!STYLES[@]}"; do
    for j in "${!COLORS[@]}"; do
        echo -e "${STYLES[$i]}${COLORS[$j]}${STYLE_NAMES[$i]} ${COLOR_NAMES[$j]} text${RESET}"
    done
done
