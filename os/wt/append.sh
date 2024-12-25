#!/usr/bin/bash

KEY_PHRASE="# XCUsability watch-with-color-and-time-v1.0"
BASHRC_FILE="$HOME/.bashrc"

# Check if the key phrase already exists in the file
if grep -q "$KEY_PHRASE" "$BASHRC_FILE"; then
    echo "The key phrase '$KEY_PHRASE' already exists in $BASHRC_FILE. No changes were made."
    exit 1
fi
# If the key phrase does not exist, append the code to the end of the file
echo "Appending code block to $BASHRC_FILE..."
cat <<EOF >>"$BASHRC_FILE"

$KEY_PHRASE
alias wt='watch -c -n.2 time '
alias wl='watch -c "pwd && ls -l --color=always"'
EOF
echo "Done."

tail "$BASHRC_FILE"
