## Wie kann man bei der Dokumentation helfen ?

Es gibt diverse Methoden wie man mit dem Github und seinen Repositories arbeitet. Entwickler benutzen git in der Befehlszeile. Wenn man bei der Dokumentation helfen will und sie verbessern und ändern will ist das aber nicht notwendig. Man kann alles im Github erledigen.

Folgende Schritte sind dazu notwendig:

1. Einmaliges kostenloses Anmelden
2. Ändern einer bestehenden Datei
3. Einstellen der Änderung in Github
4. Pull Request für die Änderung erstellen
5. Optional: Löschen des eigenen Forks

### Einmaliges kostenloses Anmelden bei Github
Man geht auf die [Githug Einstiegsseite](https://github.com) und registiert sich einmalig mit einem Namen und Kennwort (**Sign up**). Danach meldet man sich immer nur noch mit seinem Namen und Kennwort an (**Sign in**).

### Ändern einer bestehenden Datei
Dazu öffnet man das [Git Repository](https://github.com/ajacobsen/block-tracker/tree/gh-pages) welches die Dokumentation von block-tracker enthält.
Nun sieht man alle Dateien des Repositories. Die Datei [body.md](https://github.com/ajacobsen/block-tracker/blob/gh-pages/body.md) enthält die gesamte Dokumentation zu block-tracker. Alle anderen Dateien sind Beiwerk um die Dokumentation entsprechend zu formatiern. Wenn man auf den Link klicked sieht man den Inhalt. Oben rechts von der Datei steht neben **Raw Blame History** ein kleines Stiftsymbol gefolgt von einem Mülleimer. Klicked man auf den Stift kommt man in den Github Editor und kann nun die Datei beliebig ändern. Der Text in der Datei benutzt eine spezielle Markup Syntax um den Text zu mit Überschriften, Listen, Hervorhebugnen usw zu gestalten. Es gibt eine[Beschreibung von github](https://help.github.com/articles/getting-started-with-writing-and-formatting-on-github/) sowie eine [Seite](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) wo alle Markup Syntax schnell nachsehen kann. Will man sehen wie die Seite final aussieht wechselt man auf **Preview changes**.

Alternativ kann man sich die Datei als Ganzes lokal auf sein System kopieren und mit einem beliebigen Editor der beim Erstellen von Markups hilft, z.B. mit Atom, ändern. Der Vorteil liegt darin dass alles schneller geht da der Atom eine Markup Vorschau Funktion hat und man nicht ständig beim Ändern der Seite zwischen den *Raw* und *Preview* Seiten hin und her in Github wechseln muss. Zum Schluss kopiert man ein Mal die fertige Datei per copy/paste ins Github zurück und erstellt dann den *file change request*. Dazu kopiert man sich die Datei im *Raw* Format in den lokalen Editor, ändert die Datei und am Ende kopiert man sie per copy/paste wieder ins Github als *raw*.

### Einstellen der Änderung in Github
Nachdem alle Änderungen eingepflegt wurden muss die Änderung in Github abgelegt werden. Am Ende der geänderten Datei findet man eine Sektion **Propose file change**. Dort trägt man die Überschrift des Änderungsrequests ein (*Update*) sowie weitere optionale Informationen (*Add an optional extended description*). Dann klicked man auf den grünen **Propose file change** Button. Dadurch wird die Änderung im Github abgelegt.

##### Für den github Interessierten
Bei dieser Aktion wird ein Branch mit dem Namen patch-n im eigenen Fork angelegt.

### Pull request für die Änderung erstellen
Nachdem alle Änderungen eingepflegt wurden muss die Änderung dem block-tracker Owner bekanntgemacht werden. Dazu ist in Github ein Pullrequest notwendig.

Es erscheint ein neue Seite wenn man den **Propose file change** Button gedrückt hat. Durch einen Klick auf den grünen **Create pull request** Button kann man auf einer neuen Seite noch einmal die Überschrift sowie die weiteren Informationen der Änderung wenn gewünscht für den Pull Request noch einmal anpassen und mit dem grünen **Create pull request** Button wird dann der block-tracker owner über den Pull Request benachrichtigt und kann ihn bearbeiten. Wenn die Änderung akzeptiert wurde bekommt man eine entsprechende eMail von Github in dem *Merged* gefolgt von einem Link auf den Pull Request steht. Sollte es noch Kommentare vom block-tracker owner geben bekommt man dazu auch Benachrichtigungen von Github per eMail.

##### Für den github Interessierten
Bei dieser Aktion wird die vorher erstellte Änderung patch-n die sich im eigenen Fork befindet in einem Pull Request dem block-tracker Owner überreicht.

### Optional: Löschen des eigenen Forks
Nachdem der Pullrequest akzeptiert wurde kann man - muss aber nicht - den eigenen Fork wieder löschen. Beabsichtigt man aber weitere Dateiänderungen vorzunehmen ist das allerdings unnötig. Dazu geht man auf das eigene Repository (den *Fork* von block-tracker) und unter *Settings* kann man nach einer Sicherheitsabfrage den Fork löschen.

##### Für den github Interessierten
Github erstellt beim ersten Erstellen eines Pull Requests einen sogenanten *Fork*. Das ist ein Kopie der block-tracker Repositories unter dem eigenen Namen.

Auf der Repositorykopie werden alle Dateiänderungen in einem neuen *Branch* mit dem Namen *patch-1, patch-2, ...* abgelegt wenn ein **Propose file change** Request ausgeführt wird. Dieser wird dann für den Pullrequest von Github benutzt damit die Änderung vom block-tracker owner eingepflegt werden kann.
