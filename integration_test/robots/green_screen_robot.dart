import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task_flutter/colors.dart';

class GreenScreenRobot {
  const GreenScreenRobot(this.tester);

  final WidgetTester tester;

  Future<void> checkIsGreenScreen() async {
    expect(_findWhiteScreenName(), findsOneWidget);
    expect(_findGreenContainer(), findsOneWidget);
  }

  Finder _findWhiteScreenName() {
    return find.byWidgetPredicate((widget) =>
        widget is Text &&
        widget.data == 'Зеленый экран' &&
        widget.style?.color == Colors.white);
  }

  Finder _findGreenContainer() {
    return
      find.descendant(of: find.byType(Scaffold), matching: find.byWidgetPredicate(
              (widget) => widget is Container && widget.color == greenColor))

    ;
  }
}
