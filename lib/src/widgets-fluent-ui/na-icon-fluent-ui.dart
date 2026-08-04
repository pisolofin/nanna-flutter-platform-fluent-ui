import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

/// Registers the NaIcon builder for Fluent UI.
void registerNaIconFluentUi(NaUiType uiType) {
  naPlatformServiceRegisterWidgetBuilder<NaIcon>(
    uiType,
    (BuildContext context, NaIcon widget) {
      return fluent.Icon(
        widget.icon.resolve(uiType),
        size: widget.size,
        color: widget.color,
      );
    },
  );
}
