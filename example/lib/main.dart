import 'package:flutter/widgets.dart';

import 'package:nanna_flutter_platform_fluent_ui/nanna-flutter-platform-fluent-ui.dart';
import 'package:nanna_platform/nanna_platform.dart';

import 'pages/home/home-page.dart';

void main() {
  // Initialize Fluent UI bindings for Nanna Platform
  initNannaPlatformFluentUi();
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return NaUiTypeScope(
      uiTypes: <NaUiType>[naUiTypeFluent],
      child  : const NaApp(
        title: 'Fluent UI Example',
        home : HomePage(),
      ),
    );
  }
}
