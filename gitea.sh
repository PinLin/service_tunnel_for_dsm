#!/bin/sh
if [ -f /var/services/homes/pinlin/tunnel_gcp/running ]; then
    echo $$ >> /var/services/homes/pinlin/tunnel_gcp/running
    while true; do
        sudo -u pinlin ssh -NR 10081:localhost:3000 pinlin@ntut.com.tw
        sleep 1s
    done
fi
