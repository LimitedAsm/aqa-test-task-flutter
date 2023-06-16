import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test/utils/yellow_screen.dart';

class YellowScreenRobot {
  YellowScreenRobot(this.tester);

  final WidgetTester tester;

  Future<void> checkIsYellowScreen() async {
    expect(findRandomNumberButton(), findsOneWidget);
    expect(findRandomNumberText(), findsNothing);
  }

  Future<void> tapRandomNumberButton() async {
    await tester.tap(findRandomNumberButton());
    await tester.pumpAndSettle();
  }

  Future<void> checkRandomNumberIsShown() async {
    expect(findRandomNumberText(), findsOneWidget);
  }

  Future<void> validateRandomNumber() async {
    final randomNumberText = findRandomNumberText();
    final randomNumberTextWidget =
        randomNumberText.evaluate().first.widget as Text;
    final randomNumber = int.parse(randomNumberTextWidget.data!);
    expect(randomNumber >= 0 && randomNumber <= 99, true);
  }
}
