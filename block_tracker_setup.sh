#!/bin/bash

on_error() {
	echo $1
	exit 1
}

[ $UID -eq 0 ] || on_error "Du musst root sein"

if [ $# -gt 0 ] && [ $1 == "--uninstall" ]; then
	echo "Stelle /etc/hosts wider her und "
	echo "lösche /etc/hosts.d"
	echo "Fortsetzen? [j/N]"
	read -sn 1 response
	response=$(echo "${response}" | tr '[:upper:]' '[:lower:]')
	[ ${response} == j ] || on_error "Abgebrochen!"
	echo "Deinstalliere block-tracker..." 
	cp /etc/hosts.d/00-hosts /etc/hosts
	rm -r /etc/hosts.d/
	rm /usr/local/bin/block-tracker
	echo "Done"
else
	echo "Installiere block-tracker..."
	mkdir /etc/hosts.d 2>/dev/null && cp /etc/hosts /etc/hosts.d/00-hosts
	url=$(wget -qO - https://api.github.com/gists/661af20d1b892fdbe33f08708f7ef03f |python -c "import sys, json; print(json.load(sys.stdin)['files']['block_tracker.sh']['raw_url'])") || on_error "Fehler beim Abrufen er URL"
	wget -qO /usr/local/bin/block-tracker $url || on_error "Konnte ${url} nicht runterladen"
	chmod +x /usr/local/bin/block-tracker
	echo "Erfolgreich installiert nach /usr/local/bin/block-tracker"
fi
