import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe_example/MainScreen.dart';
import 'package:tic_tac_toe_example/FirstScreen.dart';
import 'package:tic_tac_toe_example/SecondScreen.dart';
import 'package:tic_tac_toe_example/globals.dart';

void main() {
  Widget testWidget = new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(
          home: new MainPage(
              value: 5,
              title: 'Simple Game',
              redbot: false,
              bluebot: false,
              record: false)));
  testWidgets(
      'Create an SOS in a simple game and test to make sure the game is over',
      (WidgetTester tester) async {
    // await tester.pumpAndSettle(Duration(seconds: 10));
    await tester.pumpWidget(testWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    var stap = find.byKey(ValueKey('S button'));
    var otap = find.byKey(ValueKey('O button'));
    var move1 = find.byKey(keylist[0]);
    await tester.tap(move1);
    await tester.pump();
    await tester.tap(otap);
    await tester.pump();
    var move2 = find.byKey(keylist[51]);
    await tester.tap(move2);
    await tester.pump();
    await tester.tap(stap);
    await tester.pump();
    var move3 = find.byKey(keylist[102]);
    await tester.tap(move3);
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
  });
}
