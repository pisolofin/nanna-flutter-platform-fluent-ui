import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

import '../fluent-ui-options.dart';

/// Registers the NaListTile builder for Fluent UI.
void registerNaListTileFluentUi(NaUiType uiType) {
  naPlatformServiceRegisterWidgetBuilder<NaListTile>(
    uiType,
    (BuildContext context, NaListTile widget) {
      final NaListTileOptions? options =
          widget.optionsBuilder?.call(context, uiType);
      final NaListTileOptionsFluentUi? fluentOptions =
          options is NaListTileOptionsFluentUi ? options : null;
      return fluent.ListTile(
        leading: widget.leading,
        title: widget.title,
        subtitle: widget.subtitle,
        trailing: widget.trailing,
        onPressed: widget.onTap,
        shape: fluentOptions?.shape ??
            const fluent.RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
        focusNode: fluentOptions?.focusNode,
        autofocus: fluentOptions?.autofocus ?? false,
      );
    },
  );
}
