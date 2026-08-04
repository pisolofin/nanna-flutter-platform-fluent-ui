import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

import '../fluent-ui-options.dart';

/// Registers the NaSlider builder for Fluent UI.
void registerNaSliderFluentUi(NaUiType uiType) {
  naPlatformServiceRegisterWidgetBuilder<NaSlider>(
    uiType,
    (BuildContext context, NaSlider widget) {
      final NaSliderOptions? options = widget.optionsBuilder?.call(context, uiType);
      final NaSliderOptionsFluentUi? fluentOptions = options is NaSliderOptionsFluentUi
        ? options
        : null
      ;
      return fluent.Slider(
        value    : widget.value,
        onChanged: widget.onChanged,
        min      : widget.min,
        max      : widget.max,
        style    : fluentOptions?.style,
        focusNode: fluentOptions?.focusNode,
      );
    },
  );
}