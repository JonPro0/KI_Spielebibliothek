# Projektbeschreibung

## 1. Idee

Bei der Web-App soll eines der bekanntesten Kartenspiele BlackJack umgesetzt werden. Hierbei wird der user gegen den Kartendealer spielen, aber mit einer Besonderheit: Der User kann sich jederzeit dazu entscheiden, Chatgpt als Hilfe zu nutzen, um den best möglichen Zug auszuwählen. Mit dem erspielten Geld soll es dann möglich sein, sein Avatar ändern zu können, zum Beispiel durch ein neues Icon oder andere Farben, die genaue Nutzung des Geldes ist zur Zeit aber noch nicht vollständig überdacht und kann sich während der Phase der Implementierung noch ändern.


## 2. Mehrwert

Gerade unter ITlern ist es bekannt, dass sie sich die Zeit alleine ganz gerne mal mit dem ein oder anderen Game vertreiben. Dabei bietet sich dann das Spiel BlackJack super an, vor allem wenn durch die Unterstützung der KI die Chance zu gewinnen steigt. Hierbei steht also vor allem der Spaß und Zeitvertreib im Vordergrund.


## 3. Anforderungen
* Client:
    * User Interfaces
        * "Shop"
        * Game an sich
            * zunächst nur Textdarstellung
            * wenn möglich mit Bildern
    * KI
        * Texteinblendung klein aber lesbar
        * Senden des Spielstandes und Hilfe bekommen
        * Antwort korrekt auslesen und darstellen
    * Logiken
        * Kartendealer
        * Der Spieler (man selbst)
* Server
    * KI
        * Korrekte Abfrage senden mit bestimmten wording
        * Antowrt in ein Objekt speichern und an Client übergeben
    * Daten
        * hier Objekt erstellen für das speichern der Antwort

## 4. Technologien
Für diese Web-App wird Flutter als Framework und Dart alsProgrammiersprache eingesetzt. Hierzu dient die Vorlesung und eigene Weiterbildung als Ansatz für diese App. Die in der Vorlesung vorgestellte Demo-Web-App bildet die Basis, auf dessen das BlackJack aufgebaut wird.