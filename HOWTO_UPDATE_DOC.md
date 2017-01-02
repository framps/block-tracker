## Wie kann man bei der Dokumentation helfen ?

Es gibt diverse Methoden wie man mit dem Github und seinen Repositories arbeitet. Entwickler benutzen git in der Befehlszeile. Wenn man bei der Dokumentation helfen will und sie verbessern und ändern will ist das aber nicht notwendig. Man kann alles im Github erledigen.

Folgende Schritte sind dazu notwendig:

1. Einmaliges kostenloses Anmelden bei Github
2. Fork des bestehenden Github Repositories
3. Ändern einer bestehenden oder erstellen einer neuen Datei
4. Commit der Änderung im eigenen Repository
5. Pull request der Änderung stellen
6. Löschen des eigenen Forks

### Einmaliges kostenloses Anmelden bei Github
Man geht auf die [Githug Einstiegsseite](https://github.com) und registiert sich einmalig mit einem Namen und Kennwort (**Sign up**). Danach meldet man sich immer nur noch mit seinem Namen und Kennwort an (**Sign in**).

### Fork des bestehenden Github Repositories
Man darf nie direkt Änderungen im block-tracker Repository vornehmen. Deshalb muss man eine Kopie von https://github.com/ajacobsen/block-tracker anlegen. Deshalb gibt es oben rechts ein **Fork** Button mit dem man die Kopie anlegt.

### Ändern einer bestehenden oder erstellen einer neuen Datei
Zuerst muss man in den Dokumentations Zweig (**branch**) wechseln. Dazu gibt es ein Dropdown Button auf dem zuerst **Branch: master** steht. Den muss man in **gh-pages** wechseln. Oder man klicked einfach den [folgenden Link](https://github.com/ajacobsen/block-tracker/tree/gh-pages) an. Nun sieht man alle Dateien in dem Repository. Die Datei [body.md](https://github.com/ajacobsen/block-tracker/blob/gh-pages/body.md) enthält die gesamte Dokumentation zu block-tracker. Wenn man auf den Link klicked sieht man den Inhalt. Oben rechts von der Datei steht neben **Raw Blame History** ein kleines Stiftsymbol gefolgt von einem Mülleimer. Klicked man auf den Stift kommt man in den Github Editor und kann nun die Datei beliebig ändern. Der Text in der Datei benutzt eine spezielle Markup Syntax um den Text zu mit Überschriften, Listen, Hervorhebugnen usw zu gestalten. Es gibt ein [Seite](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) wo alle Markup Syntax schnell nachsehen kann. Will man sehen wie die Seite final aussieht wechselt man auf **Preview changes**.

### Commit der Änderung im eigenen Repository
tbd

### Pull request der Änderung stellen
Nachdem alle Änderungen eingepflegt wurden muss die Änderung dem block-tracker Owner bekanntgemacht werden. Dazu muss ein Pullrequest erstellt werden. Dazu geht man auf den **Pull request** tab der nebem dem **Code** tab steht. Dann erscheint ein güner **New pull request** tab. Man sieht noch einmal alle Änderungen und kann dann nach Klick auf **Create pull request** Eine Überschrift für den Pullrequest eingeben sowie weitere Informationen. Dann nur noch den günen Button **Create pull request** Klicken und der block-tracker owner wird über den Pull request benachrichtigt.

### Löschen des eigenen Forks
Nachdem der Pullrequest akzeptiert wurde muss der eigene Fork wieder gelöscht werden damit beim nächsten Mal die letzten Änderungen in der Doku mit einbezogen werden.
tbd
