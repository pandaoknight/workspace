#!/usr/bin/bash

echo "Control-plane:"
grep -r v1.18 -h /etc/kubernetes|sort|uniq
echo
echo "All:"
grep -r image -h /etc/kubernetes|sort|uniq
