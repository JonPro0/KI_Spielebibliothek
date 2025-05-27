import 'package:flutter/material.dart';
import 'package:flutter_application/game_page.dart';
import 'package:flutter_application/rules_page.dart';
import 'package:flutter_application/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();

  void _startGame() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const GamePage()));
  }

  void _openShop() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ShopPage()));
  }

  void _openRules() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RulesPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .stretch, // Macht Buttons so breit wie möglich
              children: [
                SizedBox(
                  height: 50, // Höhe des Buttons
                  child: ElevatedButton(
                    onPressed: _startGame,
                    child: const Text('Spiel starten'),
                  ),
                ),
                const SizedBox(height: 16), // Abstand zwischen Buttons
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _openShop,
                    child: const Text('Shop'),
                  ),
                ),
                const SizedBox(height: 16), // Abstand zwischen Buttons
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _openRules,
                    child: const Text('Regeln'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
