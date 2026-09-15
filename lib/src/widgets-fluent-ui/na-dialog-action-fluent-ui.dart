import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

import '../fluent-ui-options.dart';

/// Registers the NaDialogAction builder for Fluent UI.
void registerNaDialogActionFluentUi(NaUiType uiType) {
  naPlatformServiceRegisterWidgetBuilder<NaDialogAction>(
    uiType,
    (BuildContext context, NaDialogAction widget) {
      final NaDialogActionOptions? options =
          widget.optionsBuilder?.call(context, uiType);
      final NaDialogActionOptionsFluentUi? fluentOptions = options is NaDialogActionOptionsFluentUi
        ? options
        : null
      ;
      return fluent.Button(
        onPressed: widget.onPressed,
        style    : fluentOptions?.style,
        child    : widget.child,
      );
    },
  );
}
