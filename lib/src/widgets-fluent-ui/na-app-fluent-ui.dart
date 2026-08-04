import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

import '../fluent-ui-options.dart';

/// Registers the NaApp builder for Fluent UI.
void registerNaAppFluentUi(NaUiType uiType) {
  naPlatformServiceRegisterWidgetBuilder<NaApp>(
    uiType,
    (BuildContext context, NaApp widget) {
      final NaAppOptions? options = widget.optionsBuilder?.call(context, uiType);
      final NaAppOptionsFluentUi? fluentOptions = options is NaAppOptionsFluentUi
        ? options
        : null
      ;
      return fluent.FluentApp(
        title                     : widget.title,
        home                      : widget.home,
        theme                     : fluentOptions?.theme,
        darkTheme                 : fluentOptions?.darkTheme,
        themeMode                 : fluentOptions?.themeMode,
        debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
      );
    },
  );
}