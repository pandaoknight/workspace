#!/usr/bin/bash

# Source the utility functions
source /root/szl1160710/script/shell_utils/bashrc_utils.sh

KEY_PHRASE="# XCUsability kubectl apply periodically/timely kap-v3.1"
BASHRC_FILE="$HOME/.bashrc"

# Create a temporary file to hold the content
CONTENT_FILE=$(mktemp)

cat <<EOF >"$CONTENT_FILE"
# Bash function to apply k8s *.yaml files in the given directory
kap() {
    local delay=2.0
    local dir
    local OPTIND opt

    # 使用 getopt 来解析短选项和长选项
    # -o 指定短选项
    # --long 指定长选项
    # -- 表示选项解析的结束
    # "\$@" 是传递给函数的所有参数
    local options=\$(getopt -o t: --long time: -- "\$@")
    if [ \$? -ne 0 ]; then
        echo "Error parsing options" >&2
        return 1
    fi

    # 设置位置参数到解析后的选项
    eval set -- "\$options"

    while true; do
        case "\$1" in
            -t|--time)
                delay="\$2"
                # Validate delay is a number (integer or float)
                if ! [[ \$delay =~ ^[0-9]+(\.[0-9]+)?\$ ]]; then
                    echo "Invalid delay value: \$delay. Please provide a valid number."
                    return 1
                fi
                shift 2
                ;;
            --)
                shift
                break
                ;;
            *)
                echo "Invalid option: \$1"
                return 1
                ;;
        esac
    done

    # 获取目录参数
    dir="\$1"

    # 以下是处理目录和文件的逻辑
    if [[ -z "\$dir" ]]; then
        echo "Error: Directory argument is missing."
        return 1
    fi

    if [[ ! -d \$dir ]]; then
        echo "Error: Directory \$dir does not exist."
        return 1
    fi

    local files=\$(find "\$dir" -name "*.yaml"|sort)
    if [[ -z "\$files" ]]; then
        echo "Error: No yaml files found in the directory \$dir."
        return 1
    fi

    echo "The following files will be applied:"
    echo "\$files"
    echo "Applying each yaml file every \$delay seconds..."

    for file in \$files; do
        echo "\$(date) Applying \$file"
        kubectl apply -f "\$file"
        sleep "\$delay"
    done
}
EOF

# Call the new function
update_bashrc "$KEY_PHRASE" "$BASHRC_FILE" "$CONTENT_FILE"

# Clean up
rm "$CONTENT_FILE"
