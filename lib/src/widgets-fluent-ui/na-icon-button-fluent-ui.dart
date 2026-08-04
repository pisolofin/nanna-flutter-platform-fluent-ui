import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

import '../fluent-ui-options.dart';

/// Registers the NaIconButton builder for Fluent UI.
void registerNaIconButtonFluentUi(NaUiType uiType) {
  naPlatformServiceRegisterWidgetBuilder<NaIconButton>(
    uiType,
    (BuildContext context, NaIconButton widget) {
      final NaIconButtonOptions? options = widget.optionsBuilder?.call(context, uiType);
      final NaIconButtonOptionsFluentUi? fluentOptions = options is NaIconButtonOptionsFluentUi
        ? options
        : null
      ;
      return fluent.IconButton(
        icon     : widget.icon,
        onPressed: widget.onPressed,
        style    : fluentOptions?.style,
        focusNode: fluentOptions?.focusNode,
        autofocus: fluentOptions?.autofocus ?? false,
      );
    },
  );
}