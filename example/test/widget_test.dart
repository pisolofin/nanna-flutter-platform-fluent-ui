import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';
import 'package:nanna_platform_fluent_ui/nanna_platform_fluent_ui.dart';


void main() {
  testWidgets('ExampleApp builds and lays out without exceptions', (
    WidgetTester tester,
  ) async {
    initNannaPlatformFluentUi();
    await tester.pumpWidget(const ExampleApp());
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Fluent UI Integration Example'), findsOneWidget);
  });
}
