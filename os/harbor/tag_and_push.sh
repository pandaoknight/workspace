#!/usr/bin/bash

# Source the utility functions
source /root/szl1160710/script/shell_utils/bashrc_utils.sh

KEY_PHRASE="# XCUsability harbor_tag_and_push-v1.0"
BASHRC_FILE="$HOME/.bashrc"

# Create a temporary file to hold the content
CONTENT_FILE=$(mktemp)

cat <<EOF >"$CONTENT_FILE"
# Set variables
HARBOR_IP="172.27.18.160"
HARBOR="harbor.xnunion.com"
REPO="cpyfreg"
REPO_DIR="utils"

hb_tag_push() {
  # Set image name
  image_name=\$1
  echo -e "\x1b[36mImage name: \$image_name\x1b[0m"

  # Set the new image names
  new_image_name1="\${HARBOR_IP}/\${REPO}/\${REPO_DIR}/\${image_name}"
  new_image_name2="\${HARBOR}/\${REPO}/\${REPO_DIR}/\${image_name}"

  # Retag the image
  docker tag \${image_name} \${new_image_name1}
  echo -e "\x1b[36mImage has been re-tagged as: \$new_image_name1\x1b[0m"

  # Push the image to the registry
  docker push \${new_image_name1}
  echo -e "\x1b[36mImage has been pushed: \$new_image_name1\x1b[0m"

  # Print the pull commands
  echo -e "\x1b[36mTo pull the image, use the following commands:\x1b[0m"
  echo "ckimages_pull \${new_image_name1}"
  echo "ckimages_pull \${new_image_name2}"
  echo "docker pull \${new_image_name1}"
  echo "docker pull \${new_image_name2}"
}

_docker_images() {
  local cur=\${COMP_WORDS[COMP_CWORD]}
  local prev=\${COMP_WORDS[COMP_CWORD-1]}
  if [[ \$prev == "hb_tag_push" ]]; then
    COMPREPLY=( \$(compgen -W "\$(docker images --format '{{.Repository}}:{{.Tag}}')" -- \$cur) )
  fi
}

complete -F _docker_images hb_tag_push
EOF

# Call the new function
update_bashrc "$KEY_PHRASE" "$BASHRC_FILE" "$CONTENT_FILE"

# Clean up
rm "$CONTENT_FILE"
