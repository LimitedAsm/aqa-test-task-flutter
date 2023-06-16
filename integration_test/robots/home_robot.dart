import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task_flutter/home_screen.dart';

class HomeRobot {
  const HomeRobot(this.tester);

  final WidgetTester tester;

  Future<void> navigateToGreenScreen() async {
    final greenButton = find.text('зеленый');
    await tester.tap(greenButton);
    await tester.pumpAndSettle();
  }

  Future<void> navigateToYellowScreen() async {
    final yellowButton = find.text('желтый');
    await tester.tap(yellowButton);
    await tester.pumpAndSettle();
  }

  Future<void> pageBack() async {
    await tester.tap(_findBackButton());
    await tester.pumpAndSettle();
  }

  Future<void> checkIsHome() async {
    expect(find.byType(HomeScreen), findsOneWidget);
  }

  Finder _findBackButton() {
    return find.byWidgetPredicate(
      (widget) => _isBackButton(widget),
      description: 'widget with icon "arrow_back"',
    );
  }

  bool _isBackButton(Widget widget) {
    return widget is Icon && widget.icon == Icons.arrow_back;
  }
}
