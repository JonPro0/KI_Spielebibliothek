import 'package:flutter/material.dart';
import 'package:flutter_application/game_page.dart';
import 'package:flutter_application/shop_page.dart';
import 'package:openapi/api.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();

  String _userInput = "";
  String _aiAnswer = "";

  ChatApi? _api;

  void _setAiAnswer(Message message) {
    setState(() {
      _aiAnswer = message.message ?? "<no message received>";
    });
  }

  void _setUserInput(String input) {
    _userInput = input;
  }

  void _startGame() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const GamePage()));
  }

  void _openShop() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ShopPage()));
  }

  void _askAI() async {
    var message = Message(
      timestamp: DateTime.now().toUtc(),
      author: MessageAuthorEnum.user,
      message: _userInput,
    );

    var response = await _api!.chat(message);

    _setAiAnswer(response!);
  }

  @override
  Widget build(BuildContext context) {
    _api = Provider.of<ChatApi>(context);

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
              ],
            ),
          ),

          /* TextField(
            key: const Key('UserInputTextField'),
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: 'Enter text here',
            ),
            onChanged: (String value) {
              _setUserInput(value);
            },
          ),
          Expanded(
            child: Text(
              _aiAnswer,
              key: const Key('AiAnswerText'),
            ),
          ), */
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Ask AI',
        onPressed: _askAI,
        child: const Icon(Icons.send),
      ),
    );
  }
}
