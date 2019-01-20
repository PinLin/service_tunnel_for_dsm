#!/bin/bash

if [ $UID != 0 ]
then
    echo "Need root permission!"
    exit 1
fi

if ! [ -f service_tunnel.sh ]
then
    echo "Please execute me in project directory."
    exit 2
fi

if [ "$1" == "" ]
then
    echo "Please give me the name of service user or give me "'$USER'"."
    exit 3
fi

(
    initctl stop tunnel_ds216j_ssh
    initctl stop tunnel_ds216j_gitea_ssh
    initctl stop tunnel_ds216j_gitea_web
    initctl stop tunnel_ds216j_web
    initctl stop tunnel_ds216j_dsm_http
    initctl stop tunnel_ds216j_dsm_https
    initctl stop tunnel_ds216j_mariadb
    initctl stop tunnel_3770_ssh
    initctl stop tunnel_3770_rdp
    rm /etc/init/tunnel_*
)  2> /dev/null

initctl reload-configuration

sed "s={{path}}=$(pwd)=g" service_tunnel.sh |\
sed "s={{service_user}}=$1=g" > /usr/local/etc/rc.d/service_tunnel.sh

chmod +x /usr/local/etc/rc.d/service_tunnel.sh
/usr/local/etc/rc.d/service_tunnel.sh start
