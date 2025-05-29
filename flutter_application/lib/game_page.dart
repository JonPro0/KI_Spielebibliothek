import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application/card_deck.dart';
import 'package:flutter_application/Card.dart';
//import 'package:openapi/api.dart';
//import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  //--------------------------------------Variablen-------------------------------------------------------------------------------------

  bool _showStartButton = true;
  bool _isButtonEnabled = false;
  bool _showResult = false;
  final CardDeck _cardDeck = CardDeck();
  List<PlayCard> _deck = [];
  final List<String> _imagePathsDealer = [];
  final List<String> _imagePathsPlayer = [];
  int _cardCount = 52;
  int zufallszahl = 0;
  int _playerScore = 0;
  int _dealerScore = 0;
  int _money = 500;
  int _oldMoney = 500;
  int _bet = 0;
  String _winner = '';
  String _aiAnswer = '';
  // ChatApi? _api;

  //-------------------------Methoden Game Logik---------------------------------------------------------------------------------------------

  void _startGame() {
    if (_bet > 0 && _bet <= _money) {
      _deck = _cardDeck.createNewCardDeck();
      setState(() {
        _showStartButton = false;
      });
      _showStartHand();
    }
  }

  void _setBet(String value) {
    final parsed = int.tryParse(value);
    if (parsed != null) {
      setState(() {
        _bet = parsed;
      });
    }
  }

  void _showStartHand() {
    setState(() async {
      await Future.delayed(const Duration(milliseconds: 500));
      zufallszahl = generateRandomNumber(_cardCount--);
      setState(() {
        _imagePathsPlayer.add(_deck[zufallszahl].img);
      });
      _playerScore += _deck[zufallszahl].value;
      _deck.removeAt(zufallszahl);

      await Future.delayed(const Duration(seconds: 1));

      zufallszahl = generateRandomNumber(_cardCount--);
      setState(() {
        _imagePathsDealer.add(_deck[zufallszahl].img);
      });
      _dealerScore += _deck[zufallszahl].value;
      _deck.removeAt(zufallszahl);

      await Future.delayed(const Duration(seconds: 1));

      zufallszahl = generateRandomNumber(_cardCount--);
      setState(() {
        _imagePathsPlayer.add(_deck[zufallszahl].img);
      });
      _playerScore += _deck[zufallszahl].value;
      _deck.removeAt(zufallszahl);

      _isButtonEnabled = true;
    });
  }

  void _takeCard() {
    zufallszahl = generateRandomNumber(_cardCount--);
    setState(() {
      _imagePathsPlayer.add(_deck[zufallszahl].img);
    });
    if (_deck[zufallszahl].value == 11 &&
        _playerScore + _deck[zufallszahl].value > 21) {
      _playerScore += 1;
    } else {
      _playerScore += _deck[zufallszahl].value;
    }
    _deck.removeAt(zufallszahl);

    if (_playerScore > 21) {
      _isButtonEnabled = false;
      _deal();
    }
  }

  void _hold() {
    _isButtonEnabled = false;
    _deal();
  }

  void _deal() async {
    while (_dealerScore < 17) {
      await Future.delayed(const Duration(seconds: 1));
      zufallszahl = generateRandomNumber(_cardCount--);
      setState(() {
        setState(() {
          _imagePathsDealer.add(_deck[zufallszahl].img);
          if (_deck[zufallszahl].value == 11 &&
              _dealerScore + _deck[zufallszahl].value > 21) {
            _dealerScore += 1;
          } else {
            _dealerScore += _deck[zufallszahl].value;
          }
        });
        _deck.removeAt(zufallszahl);
      });
    }
    await Future.delayed(const Duration(seconds: 3));
    _whoWins();
    setState(() {
      _showResult = true;
    });
  }

  void _whoWins() {
    if (_playerScore > 21 && _dealerScore <= 21) {
      _winner = 'Dealer';
      _money -= _bet;
    } else if (_playerScore <= 21 && _dealerScore > 21) {
      _winner = 'Spieler';
      _money += _bet;
    } else if (_playerScore > 21 && _dealerScore > 21) {
      _winner = 'Keiner';
    } else {
      if (_playerScore > _dealerScore) {
        _winner = 'Spieler';
        _money += _bet;
      } else if (_playerScore < _dealerScore) {
        _winner = 'Dealer';
        _money -= _bet;
      } else {
        _winner = 'Keiner';
      }
    }
  }

  void _resetGame() {
    setState(() {
      _showResult = false;
      _showStartButton = true;
      _imagePathsDealer.clear();
      _imagePathsPlayer.clear();
      _playerScore = 0;
      _dealerScore = 0;
      _oldMoney = _money;
    });
  }

  int generateRandomNumber(int x) {
    final random = Random();
    return random.nextInt(x) + 1;
  }

//-----------------------------------Methode zur Darstellung ohne KI---------------------------------------------------------

  void _setAiAnswerWithoutAI() {
    setState(() {
      _aiAnswer = ' KI sagt: -> Ich bin außer Gefecht. \n'
          'Im nächsten Update stehe ich wieder zur Verfügung';
    });
  }

//----------------------------------Methode zum Ansprechen der KI-----------------------------------------------------------------

  /* void _setAiAnswer(Message message) {
    setState(() {
      _aiAnswer =  ' KI sagt: -> ${message.message}';
      _aiAnswer += 'Karte';
    });
  } */

  /* void _askAI() async {
    String question =
        'Ich spiele gerade BlackJack und möchte wissen, welcher mein bester Zug gerade wäre.' +
            'Der Kartendealer hat eine $_dealerScore und ich eine $_playerScore. Antworte bitte so, dass wenn du eine Karte ziehen würdest mit "Karte" anwortest und wenn nicht dann mit "Halten"';
    var message = Message(
      timestamp: DateTime.now().toUtc(),
      author: MessageAuthorEnum.user,
      message: question,
    );

    var response = await _api!.chat(message);

    setState(() {
      _money -= 50;
      _setAiAnswer(response!);
    });
  } */

//-------------------------------------Design Erstellung-------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    //_api = Provider.of<ChatApi>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF0B6623),
      appBar: AppBar(title: const Text('Spiel')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //---------------------------Einsatz und Spiel starten-----------------------------------------------------------

            if (_showStartButton) ...[
              Text('Guthaben: $_money€',
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.white, // Weißer Text
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Einsatz eingeben',
                      labelStyle:
                          TextStyle(color: Colors.white), // Weißes Label
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.lightBlueAccent), // Hellblauer Rand
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.lightBlueAccent, width: 2),
                      ),
                    ),
                    onChanged: (value) {
                      _setBet(value);
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _startGame,
                child: const Text('Spiel starten'),
              ),
            ],

            //------------------------------------------Ergebnis einblenden-----------------------------------------------------

            if (_showResult) ...[
              Container(
                height: 500,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Text('Auswertung',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    const SizedBox(width: 30),
                    Text('Score vom Dealer: $_dealerScore',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20)),
                    const SizedBox(height: 30),
                    Text('Score vom Spieler: $_playerScore',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20)),
                    const SizedBox(height: 30),
                    Text('Sieger ist: $_winner',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20)),
                    const SizedBox(height: 30),
                    Text('Altes Guthaben: $_oldMoney',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20)),
                    const SizedBox(width: 30),
                    Text('Neues Guthaben: $_money',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20)),
                    ElevatedButton(
                        onPressed: _resetGame, child: const Text('Neues Spiel'))
                  ],
                ),
              )
            ],

            //--------------------------------------- Das Spiel---------------------------------------------------------------------------------------------------

            if (!_showStartButton && !_showResult) ...[
              Container(
                height: 100,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Guthaben: $_money€',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20)),
                    const SizedBox(width: 100),
                    Text('Einsatz: $_bet€',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20))
                  ],
                ),
              ),
              Text('Kartendealer -> $_dealerScore',
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
              Container(
                height: 170,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _imagePathsDealer.map((path) {
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
              const SizedBox(height: 50),
              Text('Spieler -> $_playerScore',
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
              Container(
                height: 170,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _imagePathsPlayer.map((path) {
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
              Container(
                height: 50,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: _isButtonEnabled ? _takeCard : null,
                        child: const Text('Karte')),
                    const SizedBox(width: 75),
                    ElevatedButton(
                        onPressed: _isButtonEnabled ? _hold : null,
                        child: const Text('Halten'))
                  ],
                ),
              ),
              Container(
                  height: 50,
                  alignment: Alignment.bottomRight,
                  child: Row(
                    children: [
                      FloatingActionButton(
                        tooltip:
                            'Frage die KI, was sie tun würde \n Das kostet 50€',
                        onPressed: _setAiAnswerWithoutAI,
                        child: const Icon(Icons.question_mark_sharp),
                      ),
                      Text(
                        _aiAnswer,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ))
            ]
          ],
        ),
      ),
    );
  }
}
