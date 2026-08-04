import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

import '../fluent-ui-options.dart';

/// Registers the NaCheckbox builder for Fluent UI.
void registerNaCheckboxFluentUi(NaUiType uiType) {
  naPlatformServiceRegisterWidgetBuilder<NaCheckbox>(
    uiType,
    (BuildContext context, NaCheckbox widget) {
      final NaCheckboxOptions? options = widget.optionsBuilder?.call(context, uiType);
      final NaCheckboxOptionsFluentUi? fluentOptions = options is NaCheckboxOptionsFluentUi
        ? options
        : null
      ;
      return fluent.Checkbox(
        checked  : widget.value,
        onChanged: widget.onChanged,
        style    : fluentOptions?.style,
        focusNode: fluentOptions?.focusNode,
        autofocus: fluentOptions?.autofocus ?? false,
      );
    },
  );
}