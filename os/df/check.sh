#!/usr/bin/bash

df -h|awk 'NR==1 || /dev/'|column -t
