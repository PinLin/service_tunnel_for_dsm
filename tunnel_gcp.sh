#!/bin/sh

path='/var/services/homes/pinlin/tunnel_gcp'

case $1 in
    start)
	touch $path/running
	for file in $(find $path/*.sh); do
		$file &
	done
	;;
	restart)
	$0 stop
	sleep 1s
	$0 start
	;;
    stop)
	if [ -f $path/running ]; then
		while read line; do
			kill $line
		done < $path/running
		rm $path/running
	fi
    ;;
esac
