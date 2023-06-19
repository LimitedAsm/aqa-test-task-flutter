import 'package:flutter_test/flutter_test.dart';

import 'package:test_task_flutter/main.dart' as app;

import 'robots/green_screen_robot.dart';
import 'robots/home_robot.dart';
import 'robots/yellow_screen_robot.dart';

void main() {
  group('E2E test', () {
    testWidgets('Green screen', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final homeRobot = HomeRobot(tester);
      final greenScreenRobot = GreenScreenRobot(tester);

      await homeRobot.navigateToGreenScreen();

      await greenScreenRobot.checkIsGreenScreen();

      await homeRobot.pageBack();
      await homeRobot.checkIsHome();
    });

    testWidgets('Yellow screen', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final homeRobot = HomeRobot(tester);
      final yellowScreenRobot = YellowScreenRobot(tester);

      await homeRobot.navigateToYellowScreen();

      await yellowScreenRobot.checkIsYellowScreen();
      await yellowScreenRobot.tapRandomNumberButton();
      await yellowScreenRobot.checkRandomNumberIsShown();
      await yellowScreenRobot.validateRandomNumber();

      await homeRobot.pageBack();
      await homeRobot.checkIsHome();
    });
  });
}
