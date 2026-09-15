import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

import '../fluent-ui-options.dart';

/// Registers the NaScaffold builder for Fluent UI.
void registerNaScaffoldFluentUi(NaUiType uiType) {
  naPlatformServiceRegisterWidgetBuilder<NaScaffold>(
    uiType,
    (BuildContext context, NaScaffold widget) {
      final NaScaffoldOptions? options =
          widget.optionsBuilder?.call(context, uiType);
      final NaScaffoldOptionsFluentUi? fluentOptions = options is NaScaffoldOptionsFluentUi
        ? options
        : null
      ;
      final Widget pageContent = fluent.ScaffoldPage(
        header : widget.appBar,
        content: widget.body,
      );
      return fluent.NavigationView(
        pane             : fluentOptions?.pane,
        transitionBuilder: fluentOptions?.transitionBuilder,
        content          : pageContent,
      );
    },
  );
}
