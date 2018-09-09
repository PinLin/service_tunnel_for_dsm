#!/bin/sh

path='/var/services/homes/{{user}}/service_tunnel'

case $1 in
    start)
	# DS216J SSH
	if ! [ -f /etc/init/tunnel_ds216j_ssh.conf ]; then
        cp $path/tunnel_ds216j_ssh.conf /etc/init/
        initctl reload-configuration
        initctl start tunnel_ds216j_ssh
    fi
	# DS216J Gitea
	if ! [ -f /etc/init/tunnel_ds216j_gitea.conf ]; then
        cp $path/tunnel_ds216j_gitea.conf /etc/init/
        initctl reload-configuration
        initctl start tunnel_ds216j_gitea
    fi
	# DS216J Web
	if ! [ -f /etc/init/tunnel_ds216j_web.conf ]; then
        cp $path/tunnel_ds216j_web.conf /etc/init/
        initctl reload-configuration
        initctl start tunnel_ds216j_web
    fi
	# DS216J DSM
	if ! [ -f /etc/init/tunnel_ds216j_dsm.conf ]; then
        cp $path/tunnel_ds216j_dsm.conf /etc/init/
        initctl reload-configuration
        initctl start tunnel_ds216j_dsm
    fi
	# 3770 RDP
	if ! [ -f /etc/init/tunnel_3770_rdp.conf ]; then
        cp $path/tunnel_3770_rdp.conf /etc/init/
        initctl reload-configuration
        initctl start tunnel_3770_rdp
    fi

	;;
    stop)
    ;;
esac
