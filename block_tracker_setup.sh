#!/bin/bash

EN_YES="y"
DE_YES="j"
EN_NO="n"
DE_NO="n"
YES="$(tr '[:lower:]' '[:upper:]' <<< ${LANG:0:2})_YES"
YES=${!YES}
if [ -z "${YES}" ]; then
	YES="y"
fi
NO="$(tr '[:lower:]' '[:upper:]' <<< ${LANG:0:2})_NO"
NO=${!NO}
if [ -z "${NO}" ]; then
	NO="n"
fi

MSG_UNDEFINED=0
MSG_EN[$MSG_UNDEFINED]="Undefined message. Pease report this error."
MSG_DE[$MSG_UNDEFINED]="Unbekannte Meldung. Bitte melde diesen Fehler."
MSG_NOT_ROOT=1
MSG_EN[$MSG_NOT_ROOT]="You have to be root!"
MSG_DE[$MSG_NOT_ROOT]="Du musst root sein!"
MSG_DISABLED_SUCCESS=2
MSG_EN[$MSG_DISABLED_SUCCESS]="block-tracker is now disabled"
MSG_DE[$MSG_DISABLED_SUCCESS]="block-tracker ist nun ausgeschaltet"
MSG_CONFIRM_UNINSTALL=3
MSG_EN[$MSG_CONFIRM_UNINSTALL]="Restoring /etc/hosts and deleting /etc/hosts.d/\\nContinue? [y/N]"
MSG_DE[$MSG_CONFIRM_UNINSTALL]="Stelle /etc/hosts wieder her und lösche /etc/hosts.d/\\nFortsetzen? [j/N]"
MSG_PROCESSING_UNINSTALL=4
MSG_EN[$MSG_PROCESSING_UNINSTALL]="Uninstalling block-tracker..."
MSG_DE[$MSG_PROCESSING_UNINSTALL]="Deinstalliere block-tracker..."
MSG_DONE=5
MSG_EN[$MSG_DONE]="Done."
MSG_DE[$MSG_DONE]="Fertig."
MSG_PROCESSING_INSTALL=6
MSG_EN[$MSG_PROCESSING_INSTALL]="Installing block-tracker..."
MSG_DE[$MSG_PROCESSING_INSTALL]="Installiere block-tracker..."
MSG_INSTALL_SUCCESS=7
MSG_EN[$MSG_INSTALL_SUCCESS]="Installed to %b"
MSG_DE[$MSG_INSTALL_SUCCESS]="Installiert nach %b"

MSGVAR="MSG_$(tr '[:lower:]' '[:upper:]' <<< ${LANG:0:2})"

write_to_console() { #messagenumber parm1 ... parmn
    local msgv
    local msg
    local msgn
    msgn=$1
    if [ -z $1 ]; then
        msgn=0
    fi
    msgv="$MSGVAR[$msgn]"
    msg=${!msgv}
    if [ -z "${msg}" ]; then
      msg="${MSG_EN[$msgn]}"
    fi
    printf "${msg}\n" "${@:2}"
}

if [ $UID -ne 0 ]; then
    write_to_console "${MSG_NOT_ROOT}"
    exit 1
fi

if [ $# -gt 0 ] && [ $1 == "--uninstall" ]; then
	write_to_console "${MSG_CONFIRM_UNINSTALL}"
	read -sn 1 response
	response=${response,,}
	if [ ${response} != ${YES} ]; then
		exit 0
	fi
	write_to_console "${MSG_PROCESSING_UNINSTALL}"
	cp /etc/hosts.d/00-hosts /etc/hosts
	rm -r /etc/hosts.d/
	rm /usr/local/bin/block-tracker
	write_to_console "${MSG_DONE}"
else
	write_to_console "${MSG_PROCESSING_INSTALL}"
	mkdir /etc/hosts.d 2>/dev/null && cp /etc/hosts /etc/hosts.d/00-hosts
	wget -qO /usr/local/bin/block-tracker https://raw.githubusercontent.com/ajacobsen/block-tracker/master/block_tracker.sh
	chmod +x /usr/local/bin/block-tracker
	write_to_console "${MSG_INSTALL_SUCCESS}" "/usr/local/bin/block-tracker"
fi
