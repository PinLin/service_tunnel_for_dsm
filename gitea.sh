#!/bin/sh
path='/var/services/homes/pinlin/tunnel_gcp'

while true; do
    sudo -u pinlin ssh -NR 10081:localhost:3000 pinlin@ntut.com.tw
    sleep 1s
done
