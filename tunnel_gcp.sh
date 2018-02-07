#!/bin/sh

path='/var/services/homes/{{user}}/tunnel_gcp'

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
	;;
    stop)
    ;;
esac
