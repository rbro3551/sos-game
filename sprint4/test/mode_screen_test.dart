import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe_example/MainScreen.dart';
import 'package:tic_tac_toe_example/FirstScreen.dart';
import 'package:tic_tac_toe_example/SecondScreen.dart';

void main() {
  Widget testWidget = new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(
          home: new SecondScreen(
        modeval: '',
        value: 0,
        title: 'choose mode',
      )));
  testWidgets(
      'check if navigated to main page when the general game button is pressed',
      (WidgetTester tester) async {
    await tester.pumpWidget(testWidget);
    final button = find.byKey(const ValueKey('genbutton'));
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(find.byType(MainPage), findsOneWidget);
  });
}
