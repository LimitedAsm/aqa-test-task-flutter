import 'package:flutter_test/flutter_test.dart';
import 'package:test_task_flutter/home_screen.dart';

import '../../test/utils/app_bar.dart';

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
    await tester.tap(findBackButton());
    await tester.pumpAndSettle();
  }

  Future<void> checkIsHome() async {
    expect(find.byType(HomeScreen), findsOneWidget);
  }
}
