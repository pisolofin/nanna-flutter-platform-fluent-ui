import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

import '../constants/fluent-icon-map.constant.dart';

/// Registers the NaIcon builder for Fluent UI.
void registerNaIconFluentUi(NaUiType uiType) {
  naPlatformServiceRegisterWidgetBuilder<NaIcon>(
    uiType,
    (BuildContext context, NaIcon widget) {
      final IconData resolvedIcon = widget.icon.platformIcons[uiType] ??
          fluentIconMap[widget.icon.defaultIcon] ??
          widget.icon.defaultIcon;

      return fluent.Icon(
        resolvedIcon,
        size : widget.size,
        color: widget.color,
      );
    },
  );
}
