import 'package:flutter/material.dart';
import 'package:tic_tac_toe_example/FirstScreen.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

//   runApp(MyApp());
// }
Future main() async {
  runApp(
    MaterialApp(
      title: 'SOS',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        // '/second': (context) => const SecondScreen(title: '', modeval: '', value: 0),

        // '/third': (context) => const MainPage
      },
    ),
  );
}

enum letters { S, O }
