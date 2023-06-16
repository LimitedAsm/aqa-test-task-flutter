import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_task_flutter/colors.dart';

Finder findWhiteScreenName() {
  return find.byWidgetPredicate((widget) =>
      widget is Text &&
      widget.data == 'Зеленый экран' &&
      widget.style?.color == Colors.white);
}

Finder findGreenContainer() {
  return find.descendant(
      of: find.byType(Scaffold),
      matching: find.byWidgetPredicate(
          (widget) => widget is Container && widget.color == greenColor));
}
