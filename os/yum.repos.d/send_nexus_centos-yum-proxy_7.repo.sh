#!/usr/bin/bash

cp nexus_centos-yum-proxy_7.repo /etc/yum.repos.d/
yum makecache

grep -hr '\[' /etc/yum.repos.d | sort | uniq -c | sort -n | grep --color=auto -i 'nexus' -a5
