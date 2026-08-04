import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

import '../fluent-ui-options.dart';

/// Registers the NaRadio builder for Fluent UI.
void registerNaRadioFluentUi(NaUiType uiType) {
  naPlatformServiceRegisterWidgetBuilder<NaRadio>(
    uiType,
    (BuildContext context, NaRadio widget) {
      final NaRadioOptions? options =
          widget.optionsBuilder?.call(context, uiType);
      final NaRadioOptionsFluentUi? fluentOptions = options is NaRadioOptionsFluentUi
        ? options
        : null
      ;
      return fluent.RadioGroup<dynamic>(
        groupValue: widget.groupValue,
        onChanged : widget.onChanged ?? (dynamic value) {},
        child     : fluent.RadioButton<dynamic>(
          value    : widget.value,
          style    : fluentOptions?.style,
          focusNode: fluentOptions?.focusNode,
          autofocus: fluentOptions?.autofocus ?? false,
        ),
      );
    },
  );
}
