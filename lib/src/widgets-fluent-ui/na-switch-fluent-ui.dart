import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

import '../fluent-ui-options.dart';

/// Registers the NaSwitch builder for Fluent UI.
void registerNaSwitchFluentUi(NaUiType uiType) {
  naPlatformServiceRegisterWidgetBuilder<NaSwitch>(
    uiType,
    (BuildContext context, NaSwitch widget) {
      final NaSwitchOptions? options =
          widget.optionsBuilder?.call(context, uiType);
      final NaSwitchOptionsFluentUi? fluentOptions = options is NaSwitchOptionsFluentUi
        ? options
        : null
      ;
      return fluent.ToggleSwitch(
        checked  : widget.value,
        onChanged: widget.onChanged,
        style    : fluentOptions?.style,
        focusNode: fluentOptions?.focusNode,
      );
    },
  );
}
