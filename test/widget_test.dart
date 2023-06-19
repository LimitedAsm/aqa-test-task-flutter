import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_task_flutter/colors.dart';

import 'package:test_task_flutter/random_number_generator.dart';
import 'package:test_task_flutter/yellow_screen.dart';

import 'utils/app_bar.dart';
import 'utils/yellow_screen.dart';

class MockRandomNumberGenerator extends Mock implements RandomNumberGenerator {}

void main() {
  group('Желтый экран', () {
    final generator = MockRandomNumberGenerator();
    when(() => generator.generate()).thenReturn(0);
    final yellowScreen = MaterialApp(home: YellowScreen(generator: generator));

    testWidgets('Отображаться кнопка "случайное число"', (tester) async {
      await tester.pumpWidget(yellowScreen);
      expect(findRandomNumberButton(), findsOneWidget);
    });

    testWidgets('Фон экрана желтый', (tester) async {
      await tester.pumpWidget(yellowScreen);
      expect(findBackButton(), findsOneWidget);
    });

    testWidgets('Отображаться кнопка "назад"', (tester) async {
      await tester.pumpWidget(yellowScreen);
      expect(findBackground(), findsOneWidget);
    });

    group(
        'Проверяем, что при тапе по кнопке число от 0 до 49 отображается синим цветом',
        () {
      Future<void> _validateRandomNumberColor({
        required WidgetTester tester,
        required int number,
      }) async {
        when(() => generator.generate()).thenReturn(number);
        await tester.pumpWidget(yellowScreen);
        await tester.tap(findRandomNumberButton());
        await tester.pumpAndSettle();
        final randomNumberWidget =
            findRandomNumberText().evaluate().first.widget as Text;
        final randomNumberColor = randomNumberWidget.style?.color;
        expect(randomNumberColor == blueColor, true);
      }

      testWidgets('если выпадет 0', (tester) async {
        _validateRandomNumberColor(tester: tester, number: 0);
      });
      testWidgets('если выпадет 20', (tester) async {
        _validateRandomNumberColor(tester: tester, number: 20);
      });
      testWidgets('если выпадет 49', (tester) async {
        _validateRandomNumberColor(tester: tester, number: 49);
      });
    });
  });
}
