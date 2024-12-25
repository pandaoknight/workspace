#!/usr/bin/bash

#dd if=/dev/urandom of=/tmp/testfile bs=4k count=100000 && sync && dd if=/tmp/testfile of=/dev/null bs=4k
time dd if=/dev/urandom of=/tmp/testfile bs=4k count=100000
sync
time dd if=/tmp/testfile of=/dev/shm/testfile bs=4k
sync
time dd if=/tmp/testfile of=/dev/null bs=4k

