import 'package:flutter_test/flutter_test.dart';

import 'package:nanna_flutter_platform_fluent_ui/nanna-flutter-platform-fluent-ui.dart';

void main() {
  test('Initializes Fluent UI properly and registers builders', () {
    // Invoke initialization
    initNannaPlatformFluentUi();
    
    // Verify that naUiTypeFluent is created
    expect(naUiTypeFluent.value, greaterThan(0));
  });
}
