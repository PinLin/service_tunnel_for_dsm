#!/bin/sh

path='/var/services/homes/{{user}}/service_tunnel'

case $1 in
    start)
	# SSH
	if ! [ -f /etc/init/tunnel_ssh.conf ]; then
        cp $path/tunnel_ssh.conf /etc/init/
        initctl reload-configuration
        initctl start tunnel_ssh
    fi
	# Gitea
	if ! [ -f /etc/init/tunnel_gitea.conf ]; then
        cp $path/tunnel_gitea.conf /etc/init/
        initctl reload-configuration
        initctl start tunnel_gitea
    fi
	# Web
	if ! [ -f /etc/init/tunnel_web.conf ]; then
        cp $path/tunnel_web.conf /etc/init/
        initctl reload-configuration
        initctl start tunnel_web
    fi
	# RDP
	if ! [ -f /etc/init/tunnel_rdp.conf ]; then
        cp $path/tunnel_rdp.conf /etc/init/
        initctl reload-configuration
        initctl start tunnel_rdp
    fi

	;;
    stop)
    ;;
esac
