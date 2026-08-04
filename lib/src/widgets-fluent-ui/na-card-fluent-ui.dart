import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

import '../fluent-ui-options.dart';

/// Registers the NaCard builder for Fluent UI.
void registerNaCardFluentUi(NaUiType uiType) {
  naPlatformServiceRegisterWidgetBuilder<NaCard>(
    uiType,
    (BuildContext context, NaCard widget) {
      final NaCardOptions? options =
          widget.optionsBuilder?.call(context, uiType);
      final NaCardOptionsFluentUi? fluentOptions =
          options is NaCardOptionsFluentUi ? options : null;
      return fluent.Card(
        backgroundColor: fluentOptions?.backgroundColor,
        borderColor: fluentOptions?.borderColor,
        padding: fluentOptions?.padding ?? const EdgeInsets.all(12.0),
        child: widget.child,
      );
    },
  );
}
