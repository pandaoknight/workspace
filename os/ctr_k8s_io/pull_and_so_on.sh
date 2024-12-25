#!/usr/bin/bash

# Source the utility functions
source /root/szl1160710/script/shell_utils/bashrc_utils.sh

KEY_PHRASE="# XCUsability ctr_k8s.io_hosts-dir-v1.0"
BASHRC_FILE="$HOME/.bashrc"

# Create a temporary file to hold the content
CONTENT_FILE=$(mktemp)

cat <<EOF >"$CONTENT_FILE"
NAMESPACE='k8s.io'

ckimages_pull() {
  local image_tag=\$1
  ctr -n \${NAMESPACE} images pull \${image_tag} --hosts-dir "/etc/containerd/certs.d"
}

ckimages_ls() {
  ctr -n \${NAMESPACE} images ls
}
EOF

# Call the new function
update_bashrc "$KEY_PHRASE" "$BASHRC_FILE" "$CONTENT_FILE"

# Clean up
rm "$CONTENT_FILE"
