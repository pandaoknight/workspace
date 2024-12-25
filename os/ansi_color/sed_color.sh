#!/usr/bin/bash

# Source the utility functions
source /root/szl1160710/script/shell_utils/bashrc_utils.sh

KEY_PHRASE="# XCUsability sed_color-v1.0"
BASHRC_FILE="$HOME/.bashrc"

# Create a temporary file to hold the content
CONTENT_FILE=$(mktemp)

cat <<EOF >"$CONTENT_FILE"
sed_color() {
    color=\$1
    shift
    sed "s/\(\$@\)/\x1b[\${color}m&\x1b[0m/g"
}

# Regular Colors
sed_black() { sed_color "0;30" "\$@"; }
sed_red() { sed_color "0;31" "\$@"; }
sed_green() { sed_color "0;32" "\$@"; }
sed_yellow() { sed_color "0;33" "\$@"; }
sed_blue() { sed_color "0;34" "\$@"; }
sed_purple() { sed_color "0;35" "\$@"; }
sed_cyan() { sed_color "0;36" "\$@"; }
sed_white() { sed_color "0;37" "\$@"; }

# Light Colors
sed_light_black() { sed_color "1;30" "\$@"; }
sed_light_red() { sed_color "1;31" "\$@"; }
sed_light_green() { sed_color "1;32" "\$@"; }
sed_light_yellow() { sed_color "1;33" "\$@"; }
sed_light_blue() { sed_color "1;34" "\$@"; }
sed_light_purple() { sed_color "1;35" "\$@"; }
sed_light_cyan() { sed_color "1;36" "\$@"; }
sed_light_white() { sed_color "1;37" "\$@"; }
EOF

# Call the new function
update_bashrc "$KEY_PHRASE" "$BASHRC_FILE" "$CONTENT_FILE"

# Clean up
rm "$CONTENT_FILE"
