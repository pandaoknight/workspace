#!/usr/bin/bash

sudo systemctl restart smb
sudo systemctl restart nmb
sudo systemctl start smb
sudo systemctl start nmb
