Dies ist ein Skript, um u.a. Werbung mittels der hosts Datei zu blocken.

Zum Installieren, einfach diesen Befehl ausführen:
  wget -O block-tracker-setup.sh http://pub.atze.libra.uberspace.de/block_tracker_setup.sh && sudo bash block-tracker-setup.sh

Danach kann das Skript mittels
  sudo block-tracker 
aufgerufen werden.

Das Installationsskript erstellt den Ordner '/etc/hosts.d/' und kopiert die Datei /etc/hosts nach /etc/hosts.d/00-hosts
Achtung! block-tracker fügt alle Dateien in /etc/hosts.d/ zu einer /etc/hosts
zusammen, dadurch wird die Datei /etc/hosts bei jedem Aufruf überschrieben. 
Um eigene Einträge aufzunehmen, müssen diese entweder in /etc/hosts.d/00-hosts
eingetragen werden, oder man erstellt eine weitere Datei und macht
dort die gewünschten Einträge. Z.B. /etc/hosts.d/01-meinedatei
Durch die führenden Zahlen (00, 10, ..) wird bestimmt in welcher Reihenfolge
die Dateien zusammengesetzt werden.

block-tracker benutzt diese Listen:
http://someonewhocares.org/hosts/
http://winhelp2002.mvps.org/
