#!/bin/sh

TUNNEL_NAME="{TUNNEL_NAME}"

DEVICE="{DEVICE}"
SERVICE="{SERVICE}"
LOCAL_USER="{LOCAL_USER}"
LOCAL_HOST="{LOCAL_HOST}"
LOCAL_PORT="{LOCAL_PORT}"
REMOTE_USER="{REMOTE_USER}"
REMOTE_HOST="{REMOTE_HOST}"
REMOTE_PORT="{REMOTE_PORT}"

case $1 in
start)
    # Check if config file is exist
    if ! [ -f /etc/init/$TUNNEL_NAME.conf ]; then
        template="description \"Service Tunnel for $DEVICE $SERVICE\"
            \nauthor \"Pin Lin\"
            \n
            \nstart on started sshd
            \nstop on stopping sshd
            \n
            \nsetuid $LOCAL_USER
            \n
            \nscript
            \n\twhile true
            \n\tdo
            \n\t\tssh -o \"ExitOnForwardFailure yes\" -NR $REMOTE_PORT:$LOCAL_HOST:$LOCAL_PORT $REMOTE_USER@$REMOTE_HOST
            \n\t\tsleep 1s
            \n\tdone
            \nend script
            \n
            \nrespawn
            \nrespawn limit 1000 1"
        echo -e $template >/etc/init/$TUNNEL_NAME.conf
        initctl reload-configuration
        initctl start $TUNNEL_NAME
    fi
    ;;
esac
