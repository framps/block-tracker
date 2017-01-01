# Wie kann man relativ leicht Dokumentationsänderung vornehmen?

Das Ändern der Dokumentation kann relativ einfach direkt im Github vorgenommen werden. Folgende Schritte sind dazu auszuführen:

1. Einmaliges kostenloses Anmelden bei Github
2. Fork des bestehenden Github Repositories
3. Ändern einer bestehenden oder erstellen einer neuen Datei
4. Commit der Änderung im eigenen Repository
5. Pull request der Änderung stellen

## Einmaliges kostenloses Anmelden bei Github
Man geht auf die [Githug Einstiegsseite](https://github.com) und registiert sich einmalig mit einem Namen und Kennwort (**Sign up**). Danach meldet man sich immer nur noch mit seinem Namen und Kennwort an (**Sign in**).

## Fork des bestehenden Github Repositories
Man darf nie direkt Änderungen im block-tracker Repository vornehmen. Deshalb muss man eine Kopie von https://github.com/ajacobsen/block-tracker anlegen. Deshalb gibt es oben rechts ein **Fork** Button mit dem man die Kopie anlegt.

## Ändern einer bestehenden oder erstellen einer neuen Datei
Zuerst muss man in den Dokumentations Zweig (**branch**) wechseln. Dazu gibt es ein Dropdown Button auf dem zuerst **Branch: master** steht. Den muss man in **gh-pages** wechseln. Oder man klicked einfach den [folgenden Link](https://github.com/ajacobsen/block-tracker/tree/gh-pages) an. Nun sieht man alle Dateien in dem Repository. Die Datei [body.md](https://github.com/ajacobsen/block-tracker/blob/gh-pages/body.md) enthält die gesamte Dokumentation zu block-tracker. Wenn man auf den Link klicked sieht man den Inhalt. Oben rechts von der Datei steht neben **Raw Blame History** ein kleines Stiftsymbol gefolgt von einem Mülleimer. Klicked man auf den Stift kommt man in den Github Editor und kann nun die Datei beliebig ändern. Der Text in der Datei benutzt eine spezielle Markup Syntax um den Text zu mit Überschriften, Listen, Hervorhebugnen usw zu gestalten. Es gibt ein [Seite](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) wo alle Markup Syntax schnell nachsehen kann. Will man sehen wie die Seite final aussieht wechselt man auf **Preview changes**. 

## Commit der Änderung im eigenen Repository
## Pull request der Änderung stellen
