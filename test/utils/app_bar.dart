import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Finder findBackButton() {
  return find.byWidgetPredicate(
    (widget) => _isBackButton(widget),
    description: 'widget with icon "arrow_back"',
  );
}

bool _isBackButton(Widget widget) {
  return widget is Icon && widget.icon == Icons.arrow_back;
}
