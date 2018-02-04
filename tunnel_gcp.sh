#!/bin/sh

case $1 in
    start)
	touch /var/services/homes/pinlin/tunnel_gcp/running
	/var/services/homes/pinlin/tunnel_gcp/ssh.sh &
    /var/services/homes/pinlin/tunnel_gcp/gitea.sh &
	;;
	restart)
	$0 stop
	sleep 1s
	$0 start
	;;
    stop)
	if [ -f /var/services/homes/pinlin/tunnel_gcp/running ]; then
		while read line; do
			kill $line
		done < /var/services/homes/pinlin/tunnel_gcp/running
		rm /var/services/homes/pinlin/tunnel_gcp/running
	fi
    ;;
esac
