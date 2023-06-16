import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task_flutter/keys.dart';

class YellowScreenRobot {
  YellowScreenRobot(this.tester);

  final WidgetTester tester;

  Future<void> checkIsYellowScreen() async {
    expect(_findRandomNumberButton(), findsOneWidget);
    expect(_findRandomNumberText(), findsNothing);
  }

  Future<void> tapRandomNumberButton() async {
    await tester.tap(_findRandomNumberButton());
    await tester.pumpAndSettle();
  }

  Future<void> checkRandomNumberIsShown() async {
    expect(_findRandomNumberText(), findsOneWidget);
  }

  Future<void> validateRandomNumber() async {
    final randomNumberText = _findRandomNumberText();
    final randomNumberTextWidget =
        randomNumberText.evaluate().first.widget as Text;
    final randomNumber = int.parse(randomNumberTextWidget.data!);
    expect(randomNumber >= 0 && randomNumber <= 99, true);
  }

  Finder _findRandomNumberButton() {
    return find.widgetWithText(ElevatedButton, 'Случайное число');
  }

  Finder _findRandomNumberText() {
    final randomNumberContainer = find.byKey(
      const Key(Keys.randomNumberContainerKey),
    );
    final randomNumberText = find.descendant(
      of: randomNumberContainer,
      matching: find.byType(Text),
    );
    return randomNumberText;
  }
}
