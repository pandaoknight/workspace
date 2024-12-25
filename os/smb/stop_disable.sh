#!/usr/bin/bash
set -x

sudo systemctl stop smb
sudo systemctl stop nmb
sudo systemctl disable smb
sudo systemctl disable nmb
