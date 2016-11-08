*English:*
`block-tracker` is a script to block ad and tracking services using the hosts file.

Run the following command to install it:
```
wget -O block-tracker-setup.sh https://raw.githubusercontent.com/ajacobsen/block-tracker/master/block_tracker_setup.sh && sudo bash block-tracker-setup.sh
```

After installation block-tracker can be run using the following command:
```
sudo block-tracker
```
It is needed to run `block-tracker` at least once after installation and highly adivesed to run it frequently to keep the block lists up to date.

The installer creates the folder `/etc/hosts.d/` and copies the file `/etc/hosts` to `/etc/hosts.d/00-hosts`
When the installer is run using the option `--uninstall` it copies the file back and deletes the folder.

Each time `block-tracker` runs it concatenates every file in `/etc/hosts.d/` to one file and overwrites `/etc/hosts` with the new content.
In order to make your own changes to this file you should do so either in `/etc/hosts.d/00-hosts` or create a new file file, i.e. `/etc/hosts.d/01-myfile`.

To uninstall `block-tracker` run the following command:
```
wget -O block-tracker-setup.sh https://raw.githubusercontent.com/ajacobsen/block-tracker/master/block_tracker_setup.sh && sudo bash block-tracker-setup.sh --uninstall
```
Please note: This restors `/etc/hosts` from `/etc/hosts.d/00-hosts` and deletes the folder `/etc/hosts.d/`. Make sure to save any files you created there.

`block-tracker` uses the following lists:
* http://someonewhocares.org/hosts/
* http://winhelp2002.mvps.org/

*German/Deutsch:*
Dies ist ein Skript, um u.a. Werbung mittels der hosts Datei zu blocken.

Zum Installieren, einfach folgenden Befehl ausführen:
```
wget -O block-tracker-setup.sh https://raw.githubusercontent.com/ajacobsen/block-tracker/master/block_tracker_setup.sh && sudo bash block-tracker-setup.sh
```

Danach kann das Skript mittels
```
sudo block-tracker
```
aufgerufen werden.

Das Installationsskript erstellt den Ordner `/etc/hosts.d/` und kopiert die Datei `/etc/hosts` nach `/etc/hosts.d/00-hosts`

Achtung! `block-tracker` fügt alle Dateien in `/etc/hosts.d/` zu einer `/etc/hosts`
zusammen, dadurch wird die Datei `/etc/hosts` bei jedem Aufruf überschrieben.
Um eigene Einträge aufzunehmen, müssen diese entweder in `/etc/hosts.d/00-hosts`
eingetragen werden, oder man erstellt eine weitere Datei und macht
dort die gewünschten Einträge. Z.B. `/etc/hosts.d/01-meinedatei`
Durch die führenden Zahlen (00, 10, ..) wird bestimmt in welcher Reihenfolge
die Dateien zusammengesetzt werden.

Möchte man das Skript wieder deinstallieren, genügt dieser Befehl:
```
wget -O block-tracker-setup.sh https://raw.githubusercontent.com/ajacobsen/block-tracker/master/block_tracker_setup.sh && sudo bash block-tracker-setup.sh --uninstall
```
Dabei wird die Datei `/etc/hosts.d/00-hosts` wieder nach `/etc/hosts` kopiert und das Verzeichnis `/etc/hosts.d/` sowie die Datei `/usr/local/bin/block-tracker` gelöscht.

`block-tracker` benutzt diese Listen:
* http://someonewhocares.org/hosts/
* http://winhelp2002.mvps.org/
