#!/bin/sh
path='/var/services/homes/pinlin/tunnel_gcp'

if [ -f $path/running ]; then
    echo $$ >> $path/running
    while true; do
        sudo -u pinlin ssh -NR 9488:localhost:22 pinlin@ntut.com.tw
        sleep 1s
    done
fi
