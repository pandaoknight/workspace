#!/usr/bin/bash

echo ""
grep -hr '\[' /etc/yum.repos.d | sort | uniq -c | sort -n | grep --color=auto -E '[2-9] \[' -a100
ls /etc/yum.repos.d
