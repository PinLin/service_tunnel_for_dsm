#!/bin/sh
path='/var/services/homes/pinlin/tunnel_gcp'

while true; do
    sudo -u pinlin ssh -NR 9488:localhost:22 pinlin@ntut.com.tw
    sleep 1s
done
