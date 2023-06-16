import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task_flutter/colors.dart';

import 'package:test_task_flutter/keys.dart';

Finder findRandomNumberButton() {
  return find.widgetWithText(ElevatedButton, 'Случайное число');
}

Finder findRandomNumberText() {
  final randomNumberContainer = find.byKey(
    const Key(Keys.randomNumberContainerKey),
  );
  final randomNumberText = find.descendant(
    of: randomNumberContainer,
    matching: find.byType(Text),
  );
  return randomNumberText;
}

Finder findBackground() {
  return find.descendant(
      of: find.byType(Scaffold),
      matching: find.byWidgetPredicate(
          (widget) => widget is Container && widget.color == yellowColor));
}
