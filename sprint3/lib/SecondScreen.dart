import 'package:flutter/material.dart';
import 'package:tic_tac_toe_example/MainScreen.dart';

class SecondScreen extends StatelessWidget {
  final String title;
  final int value;
  final String modeval;
  const SecondScreen(
      {Key? key,
      required this.title,
      required this.value,
      required this.modeval})
      : super(key: key);
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
                    builder: (context) =>
                        MainPage(title: modeval, value: value)));
              },
              child: const Text('Simple Game')),
          SizedBox(height: 30),
          ElevatedButton(
            key: ValueKey('genbutton'),
            onPressed: () {
              String modeval = "General Game";
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      MainPage(title: modeval, value: value)));
            },
            child: const Text('General Game'),
          ),
        ]),
      ),
    );
  }
}
