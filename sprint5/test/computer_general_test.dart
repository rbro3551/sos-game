import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe_example/MainScreen.dart';

void main() {
  Widget testWidget = new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(
          home: new MainPage(
              value: 5,
              title: 'General Game',
              redbot: true,
              bluebot: true,
              record: false)));

  testWidgets('Wait for bots to finish a general game',
      (WidgetTester tester) async {
    // await tester.pumpAndSettle(Duration(seconds: 10));
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle(Duration(seconds: 30));
    expect(find.byType(AlertDialog), findsOneWidget);
  });
}
