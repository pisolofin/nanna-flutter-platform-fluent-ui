import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

class NaAlertDialogOptionsFluentUi extends NaAlertDialogOptions {
  final fluent.ScrollController? scrollController;
  final double? maxWidth;
  final fluent.Widget? title;

  NaAlertDialogOptionsFluentUi({
    this.scrollController,
    this.maxWidth,
    this.title,
  });
}

class NaAppBarOptionsFluentUi extends NaAppBarOptions {
  final fluent.CommandBarOverflowBehavior? overflowBehavior;
  final bool? isCompact;

  NaAppBarOptionsFluentUi({
    this.overflowBehavior,
    this.isCompact,
  });
}

class NaAppOptionsFluentUi extends NaAppOptions {
  final fluent.FluentThemeData? theme;
  final fluent.FluentThemeData? darkTheme;
  final fluent.ThemeMode? themeMode;
  final fluent.NavigationPaneThemeData? navigationPaneTheme;

  NaAppOptionsFluentUi({
    this.theme,
    this.darkTheme,
    this.themeMode,
    this.navigationPaneTheme,
  });
}

class NaBottomNavigationBarOptionsFluentUi extends NaBottomNavigationBarOptions {
  final fluent.NavigationPaneThemeData? theme;

  NaBottomNavigationBarOptionsFluentUi({
    this.theme,
  });
}

class NaButtonOptionsFluentUi extends NaButtonOptions {
  final fluent.ButtonStyle? style;
  final FocusNode? focusNode;
  final bool? autofocus;

  NaButtonOptionsFluentUi({
    this.style,
    this.focusNode,
    this.autofocus,
  });
}

class NaCardOptionsFluentUi extends NaCardOptions {
  final fluent.Color? backgroundColor;
  final fluent.Color? borderColor;
  final EdgeInsetsGeometry? padding;

  NaCardOptionsFluentUi({
    this.backgroundColor,
    this.borderColor,
    this.padding,
  });
}

class NaCheckboxOptionsFluentUi extends NaCheckboxOptions {
  final fluent.CheckboxThemeData? style;
  final FocusNode? focusNode;
  final bool? autofocus;

  NaCheckboxOptionsFluentUi({
    this.style,
    this.focusNode,
    this.autofocus,
  });
}

class NaDatePickerOptionsFluentUi extends NaDatePickerOptions {
  final dynamic style;

  NaDatePickerOptionsFluentUi({
    this.style,
  });
}

class NaDialogActionOptionsFluentUi extends NaDialogActionOptions {
  final fluent.ButtonStyle? style;

  NaDialogActionOptionsFluentUi({
    this.style,
  });
}

class NaIconButtonOptionsFluentUi extends NaIconButtonOptions {
  final fluent.ButtonStyle? style;
  final FocusNode? focusNode;
  final bool? autofocus;

  NaIconButtonOptionsFluentUi({
    this.style,
    this.focusNode,
    this.autofocus,
  });
}

class NaIconOptionsFluentUi extends NaIconOptions {
  final bool? ignorePointer;

  NaIconOptionsFluentUi({
    this.ignorePointer,
  });
}

class NaListTileOptionsFluentUi extends NaListTileOptions {
  final fluent.ShapeBorder? shape;
  final FocusNode? focusNode;
  final bool? autofocus;

  NaListTileOptionsFluentUi({
    this.shape,
    this.focusNode,
    this.autofocus,
  });
}

class NaProgressIndicatorOptionsFluentUi extends NaProgressIndicatorOptions {
  final double? strokeWidth;
  final fluent.Color? activeColor;
  final fluent.Color? backgroundColor;

  NaProgressIndicatorOptionsFluentUi({
    this.strokeWidth,
    this.activeColor,
    this.backgroundColor,
  });
}

class NaRadioOptionsFluentUi extends NaRadioOptions {
  final fluent.RadioButtonThemeData? style;
  final FocusNode? focusNode;
  final bool? autofocus;

  NaRadioOptionsFluentUi({
    this.style,
    this.focusNode,
    this.autofocus,
  });
}

class NaScaffoldOptionsFluentUi extends NaScaffoldOptions {
  final fluent.NavigationPane? pane;
  final dynamic transitionBuilder;
  final fluent.ScrollController? scrollController;

  NaScaffoldOptionsFluentUi({
    this.pane,
    this.transitionBuilder,
    this.scrollController,
  });
}

class NaSliderOptionsFluentUi extends NaSliderOptions {
  final fluent.SliderThemeData? style;
  final FocusNode? focusNode;

  NaSliderOptionsFluentUi({
    this.style,
    this.focusNode,
  });
}

class NaSwitchOptionsFluentUi extends NaSwitchOptions {
  final fluent.ToggleSwitchThemeData? style;
  final FocusNode? focusNode;

  NaSwitchOptionsFluentUi({
    this.style,
    this.focusNode,
  });
}

class NaTextFieldOptionsFluentUi extends NaTextFieldOptions {
  final fluent.TextStyle? style;
  final fluent.WidgetStateProperty<fluent.BoxDecoration>? decoration;
  final String? placeholder;
  final fluent.TextStyle? placeholderStyle;
  final fluent.Widget? prefix;
  final fluent.Widget? suffix;
  final EdgeInsetsGeometry? padding;
  final FocusNode? focusNode;
  final bool? autofocus;

  NaTextFieldOptionsFluentUi({
    this.style,
    this.decoration,
    this.placeholder,
    this.placeholderStyle,
    this.prefix,
    this.suffix,
    this.padding,
    this.focusNode,
    this.autofocus,
  });
}

class NaTimePickerOptionsFluentUi extends NaTimePickerOptions {
  final dynamic style;

  NaTimePickerOptionsFluentUi({
    this.style,
  });
}
