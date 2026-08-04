import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

/// Registers the NaTimePicker builder for Fluent UI.
void registerNaTimePickerFluentUi(NaUiType uiType) {
  naPlatformServiceRegisterWidgetBuilder<NaTimePicker>(
    uiType,
    (BuildContext context, NaTimePicker widget) {
      final DateTime now = DateTime.now();
      return fluent.TimePicker(
        selected: DateTime(
          now.year,
          now.month,
          now.day,
          widget.initialTimerDuration.inHours,
          widget.initialTimerDuration.inMinutes.remainder(60),
        ),
        onChanged: (DateTime date) {
          widget.onTimerDurationChanged(Duration(
            hours: date.hour,
            minutes: date.minute,
          ));
        },
      );
    },
  );
}
