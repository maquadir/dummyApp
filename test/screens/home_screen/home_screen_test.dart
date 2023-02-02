// This is a basic Flutter screen test.
import 'package:app/screens/home_screen/home_screen.dart';
import 'package:app/theme/amaysim_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeScreen', () {
    group('build', () {
      testWidgets('renders expected elements', (WidgetTester tester) async {
        Widget widget = MaterialApp(
          theme: AmaysimTheme.themeData(),
          home: const HomeScreen(),
        );

        await tester.pumpWidget(widget);

        // Verify that our counter starts at 0.
        expect(find.text('0'), findsOneWidget);
        expect(find.text('1'), findsNothing);
      });
    });

    group('event handling', () {
      testWidgets('on `add` button tap', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: AmaysimTheme.themeData(),
            home: const HomeScreen(),
          ),
        );

        // Tap the '+' icon and trigger a frame.
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();

        // Verify that our counter has incremented.
        expect(find.text('0'), findsNothing);
        expect(find.text('1'), findsOneWidget);
      });
    });
  });
}
