import 'package:flutter_test/flutter_test.dart';

import '../../test/utils/green_screen.dart';

class GreenScreenRobot {
  const GreenScreenRobot(this.tester);

  final WidgetTester tester;

  Future<void> checkIsGreenScreen() async {
    expect(findWhiteScreenName(), findsOneWidget);
    expect(findGreenContainer(), findsOneWidget);
  }
}
