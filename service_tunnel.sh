#!/bin/sh

path='{{path}}'
user='{{service_user}}'

case $1 in
    start)
    # DS216J SSH
    if ! [ -f /etc/init/tunnel_ds216j_ssh.conf ]; then
        sed "s={{user}}=$user=g" $path/tunnel_ds216j_ssh.conf > /etc/init/tunnel_ds216j_ssh.conf
        initctl reload-configuration
        initctl start tunnel_ds216j_ssh
    fi
    # DS216J Gitea SSH
    if ! [ -f /etc/init/tunnel_ds216j_gitea_ssh.conf ]; then
        sed "s={{user}}=$user=g" $path/tunnel_ds216j_gitea_ssh.conf > /etc/init/tunnel_ds216j_gitea_ssh.conf
        initctl reload-configuration
        initctl start tunnel_ds216j_gitea_ssh
    fi
    # DS216J Gitea Web
    if ! [ -f /etc/init/tunnel_ds216j_gitea_web.conf ]; then
        sed "s={{user}}=$user=g" $path/tunnel_ds216j_gitea_web.conf > /etc/init/tunnel_ds216j_gitea_web.conf
        initctl reload-configuration
        initctl start tunnel_ds216j_gitea_web
    fi
    # DS216J Web
    if ! [ -f /etc/init/tunnel_ds216j_web.conf ]; then
        sed "s={{user}}=$user=g" $path/tunnel_ds216j_web.conf > /etc/init/tunnel_ds216j_web.conf
        initctl reload-configuration
        initctl start tunnel_ds216j_web
    fi
    # DS216J DSM HTTP
    if ! [ -f /etc/init/tunnel_ds216j_dsm_http.conf ]; then
        sed "s={{user}}=$user=g" $path/tunnel_ds216j_dsm_http.conf > /etc/init/tunnel_ds216j_dsm_http.conf
        initctl reload-configuration
        initctl start tunnel_ds216j_dsm_http
    fi
    # DS216J DSM HTTPS
    if ! [ -f /etc/init/tunnel_ds216j_dsm_https.conf ]; then
        sed "s={{user}}=$user=g" $path/tunnel_ds216j_dsm_https.conf > /etc/init/tunnel_ds216j_dsm_https.conf
        initctl reload-configuration
        initctl start tunnel_ds216j_dsm_https
    fi
    # DS216J MariaDB
    if ! [ -f /etc/init/tunnel_ds216j_mariadb.conf ]; then
        sed "s={{user}}=$user=g" $path/tunnel_ds216j_mariadb.conf > /etc/init/tunnel_ds216j_mariadb.conf
        initctl reload-configuration
        initctl start tunnel_ds216j_mariadb
    fi
    # 3770 SSH
    if ! [ -f /etc/init/tunnel_3770_ssh.conf ]; then
        sed "s={{user}}=$user=g" $path/tunnel_3770_ssh.conf > /etc/init/tunnel_3770_ssh.conf
        initctl reload-configuration
        initctl start tunnel_3770_ssh
    fi
    # 3770 RDP
    if ! [ -f /etc/init/tunnel_3770_rdp.conf ]; then
        sed "s={{user}}=$user=g" $path/tunnel_3770_rdp.conf > /etc/init/tunnel_3770_rdp.conf
        initctl reload-configuration
        initctl start tunnel_3770_rdp
    fi
    ;;
    stop)
    ;;
esac
