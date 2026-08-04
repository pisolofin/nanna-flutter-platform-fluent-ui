import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

import '../fluent-ui-options.dart';

/// Registers the NaAppBar builder for Fluent UI.
void registerNaAppBarFluentUi(NaUiType uiType) {
  naPlatformServiceRegisterWidgetBuilder<NaAppBar>(
    uiType,
    (BuildContext context, NaAppBar widget) {
      final NaAppBarOptions? options =
          widget.optionsBuilder?.call(context, uiType);
      final NaAppBarOptionsFluentUi? fluentOptions = options is NaAppBarOptionsFluentUi
        ? options
        : null
      ;
      final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
      final bool canPop = parentRoute?.canPop ?? false;

      Widget? leadingWidget = widget.leading;
      if ((leadingWidget == null) && canPop) {
        leadingWidget = fluent.IconButton(
          icon     : const fluent.Icon(fluent.FluentIcons.back),
          onPressed: () {
            Navigator.maybePop(context);
          },
        );
      }

      return fluent.Container(
        height : fluentOptions?.isCompact == true ? 40.0 : 50.0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child  : fluent.Row(
          children: <Widget>[
            // Leading widget
            if (leadingWidget != null) ...<Widget>[
              leadingWidget,
            ],
            // Title widget
            if (widget.title != null) ...<Widget>[
              fluent.Expanded(
                child: fluent.Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child  : widget.title,
                ),
              ),
            ],
            // Action widgets
            if (widget.actions != null) ...widget.actions!,
          ],
        ),
      );

    },
  );
}
