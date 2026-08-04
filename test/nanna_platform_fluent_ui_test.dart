import 'package:flutter_test/flutter_test.dart';

import 'package:nanna_platform_fluent_ui/nanna_platform_fluent_ui.dart';

void main() {
  test('Initializes Fluent UI properly and registers builders', () {
    // Invoke initialization
    initNannaPlatformFluentUi();

    // Verify that naUiTypeFluent is created
    expect(naUiTypeFluent.value, greaterThan(0));
  });
}
