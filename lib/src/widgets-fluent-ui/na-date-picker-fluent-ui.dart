import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

/// Registers the NaDatePicker builder for Fluent UI.
void registerNaDatePickerFluentUi(NaUiType uiType) {
  naPlatformServiceRegisterWidgetBuilder<NaDatePicker>(
    uiType,
    (BuildContext context, NaDatePicker widget) {
      return fluent.DatePicker(
        selected : widget.initialDate,
        onChanged: widget.onDateChanged,
      );
    },
  );
}