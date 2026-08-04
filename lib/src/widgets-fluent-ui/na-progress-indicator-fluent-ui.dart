import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

import '../fluent-ui-options.dart';

/// Registers the NaProgressIndicator builder for Fluent UI.
void registerNaProgressIndicatorFluentUi(NaUiType uiType) {
  naPlatformServiceRegisterWidgetBuilder<NaProgressIndicator>(
    uiType,
    (BuildContext context, NaProgressIndicator widget) {
      final NaProgressIndicatorOptions? options =
          widget.optionsBuilder?.call(context, uiType);
      final NaProgressIndicatorOptionsFluentUi? fluentOptions =
          options is NaProgressIndicatorOptionsFluentUi ? options : null;
      return fluent.ProgressRing(
        strokeWidth: fluentOptions?.strokeWidth ?? 4.5,
        activeColor: fluentOptions?.activeColor,
        backgroundColor: fluentOptions?.backgroundColor,
      );
    },
  );
}
