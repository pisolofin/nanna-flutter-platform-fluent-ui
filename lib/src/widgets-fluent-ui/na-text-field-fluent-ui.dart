import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

import '../fluent-ui-options.dart';

/// Registers the NaTextField builder for Fluent UI.
void registerNaTextFieldFluentUi(NaUiType uiType) {
  naPlatformServiceRegisterWidgetBuilder<NaTextField>(
    uiType,
    (BuildContext context, NaTextField widget) {
      final NaTextFieldOptions? options = widget.optionsBuilder?.call(context, uiType);
      final NaTextFieldOptionsFluentUi? fluentOptions = options is NaTextFieldOptionsFluentUi
        ? options
        : null
      ;
      return fluent.TextBox(
        controller      : widget.controller,
        obscureText     : widget.obscureText,
        onChanged       : widget.onChanged,
        style           : fluentOptions?.style,
        decoration      : fluentOptions?.decoration,
        placeholder     : fluentOptions?.placeholder,
        placeholderStyle: fluentOptions?.placeholderStyle,
        prefix          : fluentOptions?.prefix,
        suffix          : fluentOptions?.suffix,
        padding         : fluentOptions?.padding ?? const EdgeInsets.all(8.0),
        focusNode       : fluentOptions?.focusNode,
        autofocus       : fluentOptions?.autofocus ?? false,
      );
    },
  );
}