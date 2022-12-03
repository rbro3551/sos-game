import 'package:flutter/material.dart';
import 'package:tic_tac_toe_example/MainScreen.dart';

class SecondScreen extends StatefulWidget {
  final String title;
  final int value;
  final String modeval;

  SecondScreen(
      {Key? key,
      required this.title,
      required this.value,
      required this.modeval})
      : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  static String bluebot = "blue bot?";
  static String redbot = "red bot?";
  static String record = "record game?";
  Map<String, bool> bots = {
    redbot: false,
    bluebot: false,
    record: false,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Mode Selection'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              key: ValueKey('simplebutton'),
              onPressed: () {
                String modeval = "Simple Game";
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MainPage(
                        title: modeval,
                        value: widget.value,
                        redbot: bots[redbot],
                        bluebot: bots[bluebot],
                        record: bots[record])));
              },
              child: const Text('Simple Game')),
          SizedBox(height: 30),
          ElevatedButton(
            key: ValueKey('genbutton'),
            onPressed: () {
              String modeval = "General Game";
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MainPage(
                      title: modeval,
                      value: widget.value,
                      redbot: bots[redbot],
                      bluebot: bots[bluebot],
                      record: bots[record])));
            },
            child: const Text('General Game'),
          ),
          checkbox(bluebot, bots[bluebot]!),
          checkbox(redbot, bots[redbot]!),
          checkbox(record, bots[record]!)
        ]),
      ),
    );
  }

  Widget checkbox(String title, bool boolValue) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title),
        Checkbox(
          value: boolValue,
          onChanged: (value) => setState(() => bots[title] = value!),
        )
      ],
    );
  }
}
