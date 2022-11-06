import 'package:flutter/material.dart';
import 'package:tic_tac_toe_example/SecondScreen.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Board Size Selection'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                // Within the `FirstScreen` widget
                onPressed: () {
                  int value = int.parse(myController.text);
                  // Navigate to the second screen using a named route.
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SecondScreen(
                            title: 'Game-Mode',
                            value: value,
                            modeval: '',
                          )));
                },
                child: const Text('Continue'),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Enter Board Size',
                        border: OutlineInputBorder()),
                    controller: myController,
                  ))
            ]),
      ),
    );
  }
}
