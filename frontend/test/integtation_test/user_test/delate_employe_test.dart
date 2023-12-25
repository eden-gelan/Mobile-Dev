import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pro/main.dart' as app;
import 'package:pro/screens/Error_page.dart';
import 'package:pro/screens/Home.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Emplooye List load test', (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField).first, 'naty');
    await tester.enterText(find.byType(TextFormField).last, '123456');

    await tester.tap(
      find.byType(TextButton),
    );

    await Future.delayed(const Duration(seconds: 5));

    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 2));
    await tester.tap(find.byTooltip('Open navigation menu'));
    await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();

    await tester.tap(
      find.widgetWithText(ListTile, 'Emplooye'),
    );
    await tester.pumpAndSettle();

    await tester.tap(
      find.byIcon(Icons.delete).last,
    );

    await tester.pumpAndSettle();

    expect(find.text("Emplooye List"), findsOneWidget);
  });
}
