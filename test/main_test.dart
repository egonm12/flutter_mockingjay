import 'package:flutter/material.dart';
import 'package:flutter_mockingjay/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

void main() {
  group(MainApp, () {
    late MockNavigator mockNavigator;

    setUp(() {
      mockNavigator = MockNavigator();

      when(() => mockNavigator.canPop()).thenReturn(true);
      when(() => mockNavigator.pop(any())).thenReturn(null);
    });

    testWidgets('can pop a dialog', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MockNavigatorProvider(
            navigator: mockNavigator,
            child: const MyFloatingActionButton(),
          ),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();
      await tester.pumpAndSettle();

      await tester.tap(find.byType(TextButton));

      verify(() => mockNavigator.canPop()).called(1);
      verify(() => mockNavigator.pop<Object?>(any())).called(1);
    });

    testWidgets('can pop a normal widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MockNavigatorProvider(
            navigator: mockNavigator,
            child: const MyWidget(),
          ),
        ),
      );
      await tester.tap(find.byType(ElevatedButton));

      verify(() => mockNavigator.canPop()).called(1);
      verify(() => mockNavigator.pop<Object?>(any())).called(1);
    });
  });
}
