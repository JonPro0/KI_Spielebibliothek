import 'package:flutter/material.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regeln'),
        backgroundColor: Colors.green[800],
      ),
      backgroundColor:
          const Color(0xFF004d00), // Dunkles Grün wie Blackjack-Tisch
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.white, fontSize: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ziel des Spiels:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Erreiche mit deinen Karten die Punktzahl 21 oder sei höher als der Kartendealer.',
              ),
              SizedBox(height: 20),
              Text(
                'Mechaniken',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              BulletPoint('Karte -> Ich möchte noch eine Karte'),
              BulletPoint(
                  'Halten -> Ich möchte keine Karte und der nächste ist dran'),
              BulletPoint(
                  'Der Kartengeber zieht solange, bis er über oder gleich 17 Punkte hat'),
              BulletPoint(
                  'Ist er über oder gleich 17 Punkten, darf er keine Karte mehr ziehen'),
              BulletPoint(
                  'Du hast gewonnen, wenn du mehr Punkte als der Kartengeber hast und selber nicht über 21 Punkte bist'),
              SizedBox(height: 20),
              Text(
                'Werte',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Divider(color: Colors.white70),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('♣ ♠ ♥ ♦ 2           -> 2'),
                        Text('♣ ♠ ♥ ♦ 3           -> 3'),
                        Text('♣ ♠ ♥ ♦ 4           -> 4'),
                        Text('♣ ♠ ♥ ♦ 5           -> 5'),
                        Text('♣ ♠ ♥ ♦ 6           -> 6'),
                        Text('♣ ♠ ♥ ♦ 7           -> 7'),
                        Text('♣ ♠ ♥ ♦ 8           -> 8'),
                        Text('♣ ♠ ♥ ♦ 9           -> 9'),
                        Text('♣ ♠ ♥ ♦ 10         -> 10'),
                        Text('♣ ♠ ♥ ♦ Bube     -> 10'),
                        Text('♣ ♠ ♥ ♦ Dame    -> 10'),
                        Text('♣ ♠ ♥ ♦ König    -> 10'),
                        Text('♣ ♠ ♥ ♦ Ass       -> 1 / 11 (immer zu deinem Vorteil)'),
                      ],
                    ),
                  ),
                  SizedBox(width: 32),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
