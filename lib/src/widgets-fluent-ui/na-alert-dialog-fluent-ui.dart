import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

import '../fluent-ui-options.dart';

/// Registers the NaAlertDialog builder for Fluent UI.
void registerNaAlertDialogFluentUi(NaUiType uiType) {
  naPlatformServiceRegisterWidgetBuilder<NaAlertDialog>(
    uiType,
    (BuildContext context, NaAlertDialog widget) {
      final NaAlertDialogOptions? options =
          widget.optionsBuilder?.call(context, uiType);
      final NaAlertDialogOptionsFluentUi? fluentOptions =
          options is NaAlertDialogOptionsFluentUi ? options : null;
      return fluent.ContentDialog(
        title: fluentOptions?.title ?? widget.title,
        content: widget.content,
        actions: widget.actions,
        style: fluent.ContentDialogThemeData(),
        constraints: fluentOptions?.maxWidth != null
            ? BoxConstraints(maxWidth: fluentOptions!.maxWidth!)
            : const BoxConstraints(maxWidth: 368.0),
      );
    },
  );
}
