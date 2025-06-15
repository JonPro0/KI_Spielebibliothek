# Ausarbeitung
- [Ausarbeitung](#ausarbeitung)
  - [1. Einleitung](#1-einleitung)
  - [2. Einführung und Projektidee](#2-einführung-und-projektidee)
    - [2.1 Einführung BlackJack](#21-einführung-blackjack)
    - [2.2 Projektidee](#22-projektidee)
  - [3. Anforderungen](#3-anforderungen)
    - [3.1 Anforderungen an den Client](#31-anforderungen-an-den-client)
    - [3.2 Anforderungen an den Server](#32-anforderungen-an-den-server)
  - [4. Umsetzung](#4-umsetzung)
  - [5. Fazit und Ausblick](#5-fazit-und-ausblick)
    - [5.1 Fazit](#51-fazit)
    - [5.2 Ausblick](#52-ausblick)
    - [Anekdote](#anekdote)

## 1. Einleitung
Im Kontext der Vorlesung "Projekt Web Entwicklung" wurde eine Web App geschrieben, dessen Ziel es ist, sowohl technische Kompetenzen im Bereich FrontEnd, aber auch BackEnd unter Beweis zu stellen. Als Projektidee wurde eines der beliebtesten Kartenspiele gewählt: BlackJack. Das Kartenspiel wurde mit einer gewissen Besonderheit ergänzt. Nutzern der App ist es möglich, sich während des Spiels für einen Spielzug von ChatGPT beraten zu lassen.  
BlackJack ist ein klassisches Kartenspiel, da es neben dem Effekt des Glücksspiels doch einiges an Strategie hinter steckt. Damit auch Nutzer die App benutzen könnwen, die keine Vorerfahrungen in BlackJack haben und in dessen Strategien, ist es möglich, ein direkt eingebundenes Feedback von der KI zu erhalten.  
<br>
Diese Arbeit dokumentiert die Entwicklung deser WebApp. Hierbei geht diese von der Idee über die technische Umsetzung bis hin zur Reflektion der gesammelten Ergebnisse. Die Umsetzung der WebApp erfolgte durch das in der Vorlesung vorgestellte Flutter Framework unf Dart als Programmiersprache. Zudem kam die OpenAI API für die Funktionalität von ChatGpt zum Einsatz, welche ebenfalls in der Vorlesung vorgestellt wurde.

## 2. Einführung und Projektidee
### 2.1 Einführung BlackJack
BlackJack ist ein Kartenspiel, welches mit vielen gespielt werden kann, hierbei sind jedoch die Mitspieler völlig egal, da man sozusagen nur im 1vs1 gegen den Kartendealer spielt. Das Ziel des Spiels ist es, auf die Punktzahl 21 zu kommen oder eine höhere Punktzahl als der Dealer zu haben. Dabei zählen die Zahlenkarten ihren Wert der auf der Karte steht, Bildkarten 10 und das Ass entweder 1 oder 11 Punkte, immer zu deinem Vorteil. Zu Beginn des Spiels erhält man 2 Karten, der Dealer lässt bei sich eine Karte noch umgedreht. Jetzt hat man die Möglichkeit, noch eine Karte zu ziehen oder seine Punktzahl zu halten. Hält man seine Punktzahl ist nun der Kartendealer dran, welcher solange Karten aufdeckt, bis seine Punktzahl größer oder gleich 17 ist. Am Ende wird geschaut, ob der Spieler mehr Punkte hat als der Dealer, oder ob einer der beiden über 21 Punkte hat. Je nachdem wird dann der Gewinn ausgeschüttet oder das eingesetzte Geld ist weg.

### 2.2 Projektidee
Die Grundidee bestand darin, eines der beliebtesten und bekanntesten Kartenspiele als Web App zu programmieren. Hierbei um konkret zu werden um die Implementierung eines BlackJack Spiels. Da es im Internet schon zich viele Seiten gibt, wo man BlackJack spielen kann, musste diese Web App eine Besonderheit implementieren, um sich von den anderen abzuheben. Die Besonderheit besteht darin, dass es in der Web App möglich sein soll, die künstliche Intelligenz um Rat für den nächsten Spielzug zu bitten, sei es ob es statistisch besser ist noch eine Karte zu ziehen oder besser bei seiner aktuellen Punktzahl zu bleiben. Die KI soll dann kurz und knapp antworten, um den User nicht zu verwirren mit zu viel Text.  
Der Fokus beim Mehrwert wurde ganz lar auf den Spaß und Zeitvertreib gesetzt, bei dem man so auch noch schnell  und einfach das Spiel BlackJack immer mehr erlernen kann.

## 3. Anforderungen
### 3.1 Anforderungen an den Client
Bei den Anforderungen für den Client lassen sich verschiedene Kategorien festlegen, um die Anforderungen besser kapseln zu können. Zunächst einmal die User Interfaces. In dieser Web App soll es insgesamt vier User Interfaces geben. Das erste wäre die generelle Homepage der Web App, auf dieser soll sich durch eingebaute Buttons zu den anderen User Interfaces navigieren lassen. Dabei steht an oberster Stelle der Button für das starten des Spiels. Hierbei wird nun das Interface des Spiels geöffnet, auf welchem sich unter anderem eine Art BlackJacktisch befindet, zudem aber auch die Spiellogik implementiert ist. Darunter kommt man zum Shop Interface, um sich erspieltes Geld gegen kleine Belohnungen oder Änderungen eintauschen zu können. Diese Anforderung konnte jedoch im Rahmen dieser Arbeit nicht umgesetzt werden. Als dritten und letzten Button haben wir den Button, um zur Reglansicht zu kommen. Auf dieser Seite wird einem User kurz das Spiel BlackJack erklärt, damit auch jeder, der das Spiel vorher noch nicht gekannt hat, so grob weiß, wie es funktioniert.  
Zusätzlich zu den User Interfaces ist eine KI Integration nötig, um den Spielstand an die KI zu senden und die Antwort in einer kleinen Textbox anzeigen zu lassen.  
Außerdem braucht die WebApp noch bestimmte Logiken und Models, um das Kartenspiel richtig zu modellieren.

### 3.2 Anforderungen an den Server
Der Server ist hauptsächlich für die KI Kommunikation zuständig. Er soll die Anfragen und Antworten in einem Objekt übertragen und die Anfrage korrekt formulieren, also einem gewissen Wording folgen, damit auch die KI immer nur die vom Entwickler gewünschte kurze Antwort zurückliefert. Um die KI nutzen zu können wurde die bereits vorgestellte Variante aus der Vorlesung genutzt, sprich es wurde der automatisch generierte ai code verwendet.

## 4. Umsetzung
Im folgenden Kapitel wird die Paketstruktur und die technologische Umsetzung erläutert. Im Paket flutter-application befindet sich der Code fürs Frontend, sprich für den Client. Im server-application Paket befindet sich der Code fürs Backend, sprich für den Server. Im Paket tools befindet sich der Code, um den Api Code generieren zu lassen. Um diese Webapp nutzen zu können bitte zu Beginn das Tool ausführen. Im Rahmen dieser Ausarbeitung wurde schon häufiger erwähnt, dass in der Vorlesung vorgestellter Code als Basis für diese Web App genutzt wurde, deshalb wird der Fokus der Beschreibung der technischen Umsetzung sich auf den Client Teil beschränken.  

Die zwei wichtigsten Ordner im Client Bereich (flutter-application) sind der assets/images und der lib Ordner. In ersterem befinden sich alle Bilder der Spielkarten, um das Blackjack Spiel gut darstellen zu können. Im lib Ordner befindet sich dann das Herzstück dieses Projektes, der Code. In diesem Paket enthalten sind 7 Klassen, auf welche jetzt Stück für Stück eingegangen wird.  
main.dart -> In dieser Klasse befindet sich der Code um den Api Client zu registrieren und die Website aufzubauen. Um diese aufzubauen wird jedoch nicht der komplette Code hingeschrieben, was sehr unpbersichtlich wäre, sondern es wird eine weitere Klasse referenziert, die home_page.dart.  
home_page.dart -> In dieser Klasse befinden sich die in Kapitel 3.1 erwähnten Buttons, um zu den jeweiligen "Seiten" in der WebApp zu navigieren. Dafür wird der Befehl Navigator.push() verwendet.  
rules_page.dart und shop_page.dart -> Innerhalb dieser beiden Klassen werden einmal die Regeln von Blackjack erläutert und dargestellt und in der anderen Klasse befindet sich der Code für die Shop Seite, welche zu diesem Zeitpunkt noch nicht implementiert wurde.  
card.dart -> Um eine Spielkarte richtig speichern zu können, musste ein eigenes Objekt erschaffen werden, um auf verschiedene Aspekte einer Karte zugreifen zu können. Diese Karte wird dank der Klasse so gespeichert, dass eine Karte immer ein int value (Wert der Karte), einen String name für den Namen der Karte und ein String img, um den Pfad zum richtigen Bild speichern und später referenzieren zu können.  
card_deck.dart -> Hier wird ein Kartendeck erstellt, also eine generische Liste des Datentyps Card mkt allen 52 Spielkarten, die im BlackJack verwendet werden, denn Joker sind beim BlackJack nicht erlaubt. Zudem befindet sich dort eine Methode, um dieses Kartendeck an den Adressor zurückzugeben und diesem ein neues Kartendeck zu erstellen.  
game_page.dart ->

## 5. Fazit und Ausblick
### 5.1 Fazit
Die Entwicklung eines Blackjack Spiels als Web App konnte Fähigkeiten sowohl im Frontend, als auch im Backend erheblich verbessern. Der Umgang mit einer völlig neuen Technologie so wie Flutter hat sich zu Anfang als Herausforderung dargestellt, jedoch wurde diese über die Zeit kennen und lieben gelernt. Vor allem beim testen (der Spielmechaniken, nicht des Codes) hat sich erwiesen, dass der Fokus beim Mehrwert ganz klar richtig gesetzt wurde, auf den Spaß! Es ließen sich hervorragend bekannte Konzepte aus Vorlesungen umsetzen und implementieren. Bei der Entwicklung gab es verschiedene Erfolge, wie zum Beispiel die gerade schon erähnten Fähigkeiten im Front - und BackEnd, aber auch die KI Integration plus dessen Darstellung hinterließ bei Testpersonen ein positives Feedback.

### 5.2 Ausblick
Auch wenn einiges der Anforsrungen erfolgreich umgesetzt wurde, gibt es noch ein paar Stellen, wo auch nach der Vorlesung weiter an dieser App gearbeitet werden wird. Der Shop soll vollständig integriert werden, sodass User auch mit ihrem erspielten Geld etwas anfangen können. Die genaue Verwendung des Geldes ist hierbei noch nicht vollständig überdacht, jedoch wird es vermutlich in die Richtung gehen, sich optische Anpassungen leisten zu können oder vergünstigte KI Nutzungen, wie in einem Bundle mit 2-fachen Wert zum Beispiel.  
Außerdem soll die Web App an eine Datenbank angebunden werden, um zum Beispiel User Management einzubauen, sodass das Geld zu den zugehörigen Nutzern gespeichert werden kann. Eine weitere Erweiterung wäre ein Multiplayer Modus, sodass man auch mit seinen Freunden zeitgleich in der gleichen Runde zusammen spielen kann. Zu guter letzt, um dem Namen des Repositorys auch gerecht zu werden, werden in Zukunft noch einige weitere bekannte Spiele mit der Besonderheit der KI Integration implementiert werden.

### Anekdote
Its not gambling if you always win, so have fun!
