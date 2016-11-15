#!/bin/bash

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
MSG_EN[$MSG_CONFIRM_UNINSTALL]="Restoring /etc/hosts and deleting /etc/hosts.d/\\nContinue? [%b]"
MSG_DE[$MSG_CONFIRM_UNINSTALL]="Stelle /etc/hosts wieder her und lösche /etc/hosts.d/\\nFortsetzen? [%b]"
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
MSG_EN[$MSG_INSTALL_SUCCESS]="Installation in %b finished"
MSG_DE[$MSG_INSTALL_SUCCESS]="Installation in %b beendet"
MSG_YES_NO=8
MSG_EN[$MSG_YES_NO]="y/N"
MSG_DE[$MSG_YES_NO]="j/N"
MSG_NOT_INSTALLED=9
MSG_EN[$MSG_NOT_INSTALLED]="%b is not installed"
MSG_DE[$MSG_NOT_INSTALLED]="%b ist nicht installiert"

MSGVAR="MSG_$(tr '[:lower:]' '[:upper:]' <<< ${LANG:0:2})"

INSTALL_PATH="/usr/local/bin"
INSTALL_NAME="block_tracker"
EXECUTABLE_NAME=${INSTALL_NAME/_/-}						# executable has hypen instead of underscore !!!

get_message() { #messagenumber
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
    echo "$msg"
}

write_to_console() { #messagenumber parm1 ... parmn
	local msg
	msg=$(get_message "$1")
    printf "${msg}\n" "${@:2}"
}

if [ $UID -ne 0 ]; then
    write_to_console "${MSG_NOT_ROOT}"
    exit 1
fi

if [ $# -gt 0 ] && [ $1 == "--uninstall" ]; then
	if [[ ! -f "${INSTALL_PATH}/${EXECUTABLE_NAME}" ]]; then
		write_to_console "${MSG_NOT_INSTALLED}" "${EXECUTABLE_NAME}"
		exit 1
	fi
	yesno=$(get_message "${MSG_YES_NO}")
	write_to_console "${MSG_CONFIRM_UNINSTALL}" "$yesno"
	read -sn 1 response
	response=${response,,}
	yesno=${yesno,,}
	if [[ ${response} != ${yesno:0:1} ]]; then
		exit 0
	fi
	write_to_console "${MSG_PROCESSING_UNINSTALL}"
	cp /etc/hosts.d/00-hosts /etc/hosts
	rm -r /etc/hosts.d/
	rm "${INSTALL_PATH}/${EXECUTABLE_NAME}"
	write_to_console "${MSG_DONE}"
else
	write_to_console "${MSG_PROCESSING_INSTALL}"
	mkdir /etc/hosts.d 2>/dev/null && cp /etc/hosts /etc/hosts.d/00-hosts
	wget -qO "${INSTALL_PATH}/${EXECUTABLE_NAME}" https://raw.githubusercontent.com/ajacobsen/block-tracker/master/${INSTALL_NAME}.sh
	chmod +x "${INSTALL_PATH}/${EXECUTABLE_NAME}"
	write_to_console "${MSG_INSTALL_SUCCESS}" "${INSTALL_PATH}"
fi
