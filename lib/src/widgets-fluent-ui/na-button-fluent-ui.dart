import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

import '../fluent-ui-options.dart';

/// Registers the NaButton builder for Fluent UI.
void registerNaButtonFluentUi(NaUiType uiType) {
  naPlatformServiceRegisterWidgetBuilder<NaButton>(
    uiType,
    (BuildContext context, NaButton widget) {
      final NaButtonOptions? options =
          widget.optionsBuilder?.call(context, uiType);
      final NaButtonOptionsFluentUi? fluentOptions =
          options is NaButtonOptionsFluentUi ? options : null;
      return fluent.Button(
        onPressed: widget.onPressed,
        style: fluentOptions?.style,
        focusNode: fluentOptions?.focusNode,
        autofocus: fluentOptions?.autofocus ?? false,
        child: widget.child,
      );
    },
  );
}
