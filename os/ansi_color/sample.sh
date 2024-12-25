#!/usr/bin/bash

# 定义颜色和样式代码
RESET="\e[0m"

# 格式
BOLD="\e[1m"
DIM="\e[2m"
UNDERLINE="\e[4m"
BLINK="\e[5m"
REVERSE="\e[7m"
HIDDEN="\e[8m"

# 常规颜色
BLACK="\e[30m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
WHITE="\e[37m"

# 背景颜色
BG_BLACK="\e[40m"
BG_RED="\e[41m"
BG_GREEN="\e[42m"
BG_YELLOW="\e[43m"
BG_BLUE="\e[44m"
BG_MAGENTA="\e[45m"
BG_CYAN="\e[46m"
BG_WHITE="\e[47m"

# 显示颜色和样式
echo -e "颜色和样式示例："
echo -e "普通Normal，${BOLD}加粗Bold${RESET}，${DIM}暗淡Dim${RESET}，${UNDERLINE}下划线Underline${RESET}，${BLINK}闪烁Blink${RESET}，${REVERSE}反转Reverse${RESET}，${HIDDEN}隐藏Hidden${RESET}"
echo -e "${BLACK}Black text${RESET}"
echo -e "${RED}Red text${RESET}"
echo -e "${GREEN}Green text${RESET}"
echo -e "${YELLOW}Yellow text${RESET}"
echo -e "${BLUE}Blue text${RESET}"
echo -e "${MAGENTA}Magenta text${RESET}"
echo -e "${CYAN}Cyan text${RESET}"
echo -e "${WHITE}White text${RESET}"
echo -e "${BG_BLACK}Black background${RESET}"
echo -e "${BG_RED}Red background${RESET}"
echo -e "${BG_GREEN}Green background${RESET}"
echo -e "${BG_YELLOW}Yellow background${RESET}"
echo -e "${BG_BLUE}Blue background${RESET}"
echo -e "${BG_MAGENTA}Magenta background${RESET}"
echo -e "${BG_CYAN}Cyan background${RESET}"
echo -e "${BG_WHITE}White background${RESET}"

# 使用sed添加颜色
echo -e "This is normal text" | sed "s/normal/${RED}&${RESET}/"
