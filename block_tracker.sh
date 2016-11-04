#!/bin/bash

# Version vom 04.11.2016 

# Dies ist ein Skript, um u.a. Werbung mittels der hosts Datei zu blocken.
# Bevor das Skript benutzt werden kann, müssen folgende Schritte ausgeführt werden:
#
# sudo mkdir /etc/hosts.d
# cp /etc/hosts /etc/hosts.d/00-hosts
#
# Achtung! Das Skript fügt alle Dateien in /etc/hosts.d/ zu einer /etc/hosts
# zusammen, dadurch wird die Datei /etc/hosts bei jedem Aufruf überschrieben. 
# Um eigene Einträge aufzunehmen, müssen diese entweder in /etc/hosts.d/00-hosts
# eingetragen werden, oder man erstellt eine weitere Datei und macht
# dort die gewünschten Einträge. Z.B. /etc/hosts.d/01-meinedatei
# Durch die führenden Zahlen (00, 10, ..) wird bestimmt in welcher Reihenfolge
# die Dateien zusammengesetzt werden. Man kann das praktisch mit beliebig vielen Dateien machen.
# 

if [ $UID -ne 0 ]; then
    echo "Du musst root sein"
    exit 1
fi

# Prüfe ob /etc/hosts.d und /etc/hosts.d/00-hosts existieren
( [ -d /etc/hosts.d ] && [ -f /etc/hosts.d/00-hosts ] ) || \
    ( echo Bitte lese die Anweisungen unter \
    http://www.linuxmintusers.de/index.php?topic=16254.msg206137#msg206137 \
    oder am Anfang dieses Skripts. )

# Download der hosts Dateien
# Entfernen von carriage returns
# Entfernen von localhost und broadcast Adressen
# Entfernen von allen Kommentaren
# Entfernen aller Zeilen, die nicht mit 0.0.0.0 beginnen
# Entfernen von Leerzeilen
wget -qO - http://winhelp2002.mvps.org/hosts.txt| \
    sed -e 's/\r//' -e '/^127/d' -e '/^255.255.255.255/d' -e '/::1/d' -e 's/#.*$//' -e '/^0.0.0.0/!d' -e '/^$/d'|\
    sort -u >/etc/hosts.d/10-mvpblocklist || \
    echo "WARNUNG! Download von http://winhelp2002.mvps.org/hosts.txt fehlgeschlagen"
wget -qO - http://someonewhocares.org/hosts/zero/hosts| \
    sed -e 's/\r//' -e '/^127/d' -e '/^255.255.255.255/d' -e '/::1/d' -e 's/#.*$//' -e '/^0.0.0.0/!d' -e '/^$/d'|\
    sort -u >/etc/hosts.d/20-some1whocaresblocklist || \
    echo "WARNUNG! Download von http://someonewhocares.org/hosts/zero/hosts fehlgeschlagen"

# Lösche /etc/hosts
rm /etc/hosts 2>/dev/null

# Verbinde Datein in /etc/hosts.d/ zu einer /etc/hosts
for f in /etc/hosts.d/*; do 
    cat "${f}" >> /etc/hosts
done

echo Done
