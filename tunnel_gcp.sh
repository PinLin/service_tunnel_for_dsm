#!/bin/sh

path='/var/services/homes/pinlin/tunnel_gcp'

case $1 in
    start)
	touch $path/running
	for file in $(find $path/*.sh); do
		$file &
	done
	;;
    stop)
    ;;
esac
