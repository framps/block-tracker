#!/bin/bash

on_error() {
	echo $1
	exit 1
}

[ $UID -eq 0 ] || on_error "Du musst root sein"

if [ $# -gt 0 ] && [ $1 == "--uninstall" ]; then
	echo "Stelle /etc/hosts wieder her und lösche /etc/hosts.d"
	echo "Fortsetzen? [j/N]"
	read -sn 1 response
	response=${response,,}
	[ "${response}" != "j" ] && exit 1	# just quit
	echo "Deinstalliere block-tracker..." 
	cp /etc/hosts.d/00-hosts /etc/hosts
	rm -r /etc/hosts.d/
	rm /usr/local/bin/block-tracker
	echo "Done"
else
	echo "Installiere block-tracker..."
	mkdir /etc/hosts.d 2>/dev/null && cp /etc/hosts /etc/hosts.d/00-hosts
	wget -qO /usr/local/bin/block-tracker https://raw.githubusercontent.com/ajacobsen/block-tracker/master/block_tracker.sh || on_error "Konnte ${url} nicht runterladen"
	chmod +x /usr/local/bin/block-tracker
	echo "Erfolgreich installiert nach /usr/local/bin/block-tracker"
fi

