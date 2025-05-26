import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application/card_deck.dart';
import 'package:flutter_application/Card.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool _showStartButton = true;
  final CardDeck _cardDeck = CardDeck();
  List<PlayCard> _deck = [];
  final List<String> _imagePaths = [];
  int _cardCount = 52;
  int zufallszahl = 0;
  double _padding = 765;

  void _startGame() {
    setState(() {
      _showStartButton = false;
    });

    _deck = _cardDeck.createNewCardDeck();
  }

  void _takeCard() {
    zufallszahl = generateRandomNumber(_cardCount--);
    setState(() {
      _imagePaths.add(_deck[zufallszahl].img);
      _padding -= 75;
    });
    _deck.removeAt(zufallszahl);
  }

  int generateRandomNumber(int x) {
    final random = Random();
    return random.nextInt(x) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF0B6623),
        appBar: AppBar(title: const Text('Spiel')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_showStartButton)
                ElevatedButton(
                  onPressed: _startGame,
                  child: const Text('Spiel starten'),
                ),
              if (!_showStartButton) ...[
                const Text('Kartendealer',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Container(
                  height: 170,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _imagePaths.map((path) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Image.asset(
                          path,
                          width: 85,
                          height: 170,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 100),
                const Text('Spieler',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Container(
                  height: 170,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _imagePaths.map((path) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Image.asset(
                          path,
                          width: 85,
                          height: 170,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                ElevatedButton(
                    onPressed: _takeCard, child: const Text('Ziehen'))
              ]
            ],
          ),
        ));
  }
}
