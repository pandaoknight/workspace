#!/usr/bin/bash

systemctl status kubelet -l|grep -oP 'ImagePullBackOff.*'
echo
echo "images:"
systemctl status kubelet -l|grep -oP 'ImagePullBackOff.*'|grep -Po '(?<=\\").+(?=\\")'
