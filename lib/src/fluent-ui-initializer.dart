import 'package:nanna_platform/nanna_platform.dart';

import 'widgets-fluent-ui/na-app-fluent-ui.dart';
import 'widgets-fluent-ui/na-card-fluent-ui.dart';
import 'widgets-fluent-ui/na-icon-fluent-ui.dart';
import 'widgets-fluent-ui/na-radio-fluent-ui.dart';
import 'widgets-fluent-ui/na-button-fluent-ui.dart';
import 'widgets-fluent-ui/na-slider-fluent-ui.dart';
import 'widgets-fluent-ui/na-switch-fluent-ui.dart';
import 'widgets-fluent-ui/na-app-bar-fluent-ui.dart';
import 'widgets-fluent-ui/na-checkbox-fluent-ui.dart';
import 'widgets-fluent-ui/na-scaffold-fluent-ui.dart';
import 'widgets-fluent-ui/na-list-tile-fluent-ui.dart';
import 'widgets-fluent-ui/na-text-field-fluent-ui.dart';
import 'widgets-fluent-ui/na-icon-button-fluent-ui.dart';
import 'widgets-fluent-ui/na-date-picker-fluent-ui.dart';
import 'widgets-fluent-ui/na-time-picker-fluent-ui.dart';
import 'widgets-fluent-ui/na-alert-dialog-fluent-ui.dart';
import 'widgets-fluent-ui/na-dialog-action-fluent-ui.dart';
import 'widgets-fluent-ui/na-progress-indicator-fluent-ui.dart';
import 'widgets-fluent-ui/na-bottom-navigation-bar-fluent-ui.dart';

late final NaUiType naUiTypeFluent;

void initNannaPlatformFluentUi() {
  naUiTypeFluent = naPlatformServiceRegisterUiType(
    styleId: 'fluent',
    uiType : 'fluent_ui',
  );

  registerNaAlertDialogFluentUi(naUiTypeFluent);
  registerNaAppBarFluentUi(naUiTypeFluent);
  registerNaAppFluentUi(naUiTypeFluent);
  registerNaBottomNavigationBarFluentUi(naUiTypeFluent);
  registerNaButtonFluentUi(naUiTypeFluent);
  registerNaCardFluentUi(naUiTypeFluent);
  registerNaCheckboxFluentUi(naUiTypeFluent);
  registerNaDatePickerFluentUi(naUiTypeFluent);
  registerNaDialogActionFluentUi(naUiTypeFluent);
  registerNaIconButtonFluentUi(naUiTypeFluent);
  registerNaIconFluentUi(naUiTypeFluent);
  registerNaListTileFluentUi(naUiTypeFluent);
  registerNaProgressIndicatorFluentUi(naUiTypeFluent);
  registerNaRadioFluentUi(naUiTypeFluent);
  registerNaScaffoldFluentUi(naUiTypeFluent);
  registerNaSliderFluentUi(naUiTypeFluent);
  registerNaSwitchFluentUi(naUiTypeFluent);
  registerNaTextFieldFluentUi(naUiTypeFluent);
  registerNaTimePickerFluentUi(naUiTypeFluent);
}
