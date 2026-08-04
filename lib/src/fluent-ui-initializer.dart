import 'package:flutter/widgets.dart';

import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

import 'fluent-ui-options.dart';

late final NaUiType naUiTypeFluent;

void initNannaPlatformFluentUi() {
  naUiTypeFluent = naPlatformServiceRegisterUiType(
    styleId: 'fluent',
    uiType : 'fluent_ui',
  );

  naPlatformServiceRegisterWidgetBuilder<NaButton>(
    naUiTypeFluent,
    (BuildContext context, NaButton widget) {
      final NaButtonOptions? options = widget.optionsBuilder?.call(context, naUiTypeFluent);
      final NaButtonOptionsFluentUi? fluentOptions = options is NaButtonOptionsFluentUi ? options : null;
      return fluent.Button(
        onPressed: widget.onPressed,
        style    : fluentOptions?.style,
        focusNode: fluentOptions?.focusNode,
        autofocus: fluentOptions?.autofocus ?? false,
        child    : widget.child,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaAppBar>(
    naUiTypeFluent,
    (BuildContext context, NaAppBar widget) {
      final NaAppBarOptions? options = widget.optionsBuilder?.call(context, naUiTypeFluent);
      final NaAppBarOptionsFluentUi? fluentOptions = options is NaAppBarOptionsFluentUi ? options : null;
      return fluent.Container(
        height : fluentOptions?.isCompact == true ? 40.0 : 50.0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child  : fluent.Row(
          children: <Widget>[
            if (widget.leading != null) widget.leading!,
            if (widget.title != null)
              fluent.Expanded(
                child: fluent.Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child  : widget.title,
                ),
              ),
            if (widget.actions != null) ...widget.actions!,
          ],
        ),
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaScaffold>(
    naUiTypeFluent,
    (BuildContext context, NaScaffold widget) {
      final NaScaffoldOptions? options = widget.optionsBuilder?.call(context, naUiTypeFluent);
      final NaScaffoldOptionsFluentUi? fluentOptions = options is NaScaffoldOptionsFluentUi ? options : null;
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

  naPlatformServiceRegisterWidgetBuilder<NaApp>(
    naUiTypeFluent,
    (BuildContext context, NaApp widget) {
      final NaAppOptions? options = widget.optionsBuilder?.call(context, naUiTypeFluent);
      final NaAppOptionsFluentUi? fluentOptions = options is NaAppOptionsFluentUi ? options : null;
      return fluent.FluentApp(
        title                     : widget.title,
        home                      : widget.home,
        theme                     : fluentOptions?.theme,
        darkTheme                 : fluentOptions?.darkTheme,
        themeMode                 : fluentOptions?.themeMode,
        debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaIconButton>(
    naUiTypeFluent,
    (BuildContext context, NaIconButton widget) {
      final NaIconButtonOptions? options = widget.optionsBuilder?.call(context, naUiTypeFluent);
      final NaIconButtonOptionsFluentUi? fluentOptions = options is NaIconButtonOptionsFluentUi ? options : null;
      return fluent.IconButton(
        icon     : widget.icon,
        onPressed: widget.onPressed,
        style    : fluentOptions?.style,
        focusNode: fluentOptions?.focusNode,
        autofocus: fluentOptions?.autofocus ?? false,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaSwitch>(
    naUiTypeFluent,
    (BuildContext context, NaSwitch widget) {
      final NaSwitchOptions? options = widget.optionsBuilder?.call(context, naUiTypeFluent);
      final NaSwitchOptionsFluentUi? fluentOptions = options is NaSwitchOptionsFluentUi ? options : null;
      return fluent.ToggleSwitch(
        checked  : widget.value,
        onChanged: widget.onChanged,
        style    : fluentOptions?.style,
        focusNode: fluentOptions?.focusNode,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaCheckbox>(
    naUiTypeFluent,
    (BuildContext context, NaCheckbox widget) {
      final NaCheckboxOptions? options = widget.optionsBuilder?.call(context, naUiTypeFluent);
      final NaCheckboxOptionsFluentUi? fluentOptions = options is NaCheckboxOptionsFluentUi ? options : null;
      return fluent.Checkbox(
        checked  : widget.value,
        onChanged: widget.onChanged,
        style    : fluentOptions?.style,
        focusNode: fluentOptions?.focusNode,
        autofocus: fluentOptions?.autofocus ?? false,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaSlider>(
    naUiTypeFluent,
    (BuildContext context, NaSlider widget) {
      final NaSliderOptions? options = widget.optionsBuilder?.call(context, naUiTypeFluent);
      final NaSliderOptionsFluentUi? fluentOptions = options is NaSliderOptionsFluentUi ? options : null;
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

  naPlatformServiceRegisterWidgetBuilder<NaProgressIndicator>(
    naUiTypeFluent,
    (BuildContext context, NaProgressIndicator widget) {
      final NaProgressIndicatorOptions? options = widget.optionsBuilder?.call(context, naUiTypeFluent);
      final NaProgressIndicatorOptionsFluentUi? fluentOptions = options is NaProgressIndicatorOptionsFluentUi ? options : null;
      return fluent.ProgressRing(
        strokeWidth    : fluentOptions?.strokeWidth ?? 4.5,
        activeColor    : fluentOptions?.activeColor,
        backgroundColor: fluentOptions?.backgroundColor,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaCard>(
    naUiTypeFluent,
    (BuildContext context, NaCard widget) {
      final NaCardOptions? options = widget.optionsBuilder?.call(context, naUiTypeFluent);
      final NaCardOptionsFluentUi? fluentOptions = options is NaCardOptionsFluentUi ? options : null;
      return fluent.Card(
        backgroundColor: fluentOptions?.backgroundColor,
        borderColor    : fluentOptions?.borderColor,
        padding        : fluentOptions?.padding ?? const EdgeInsets.all(12.0),
        child          : widget.child,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaListTile>(
    naUiTypeFluent,
    (BuildContext context, NaListTile widget) {
      final NaListTileOptions? options = widget.optionsBuilder?.call(context, naUiTypeFluent);
      final NaListTileOptionsFluentUi? fluentOptions = options is NaListTileOptionsFluentUi ? options : null;
      return fluent.ListTile(
        leading  : widget.leading,
        title    : widget.title,
        subtitle : widget.subtitle,
        trailing : widget.trailing,
        onPressed: widget.onTap,
        shape    : fluentOptions?.shape ?? const fluent.RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
        focusNode: fluentOptions?.focusNode,
        autofocus: fluentOptions?.autofocus ?? false,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaAlertDialog>(
    naUiTypeFluent,
    (BuildContext context, NaAlertDialog widget) {
      final NaAlertDialogOptions? options = widget.optionsBuilder?.call(context, naUiTypeFluent);
      final NaAlertDialogOptionsFluentUi? fluentOptions = options is NaAlertDialogOptionsFluentUi ? options : null;
      return fluent.ContentDialog(
        title    : fluentOptions?.title ?? widget.title,
        content  : widget.content,
        actions  : widget.actions,
        style    : fluent.ContentDialogThemeData(),
        constraints: fluentOptions?.maxWidth != null
            ? BoxConstraints(maxWidth: fluentOptions!.maxWidth!)
            : const BoxConstraints(maxWidth: 368.0),
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaDialogAction>(
    naUiTypeFluent,
    (BuildContext context, NaDialogAction widget) {
      final NaDialogActionOptions? options = widget.optionsBuilder?.call(context, naUiTypeFluent);
      final NaDialogActionOptionsFluentUi? fluentOptions = options is NaDialogActionOptionsFluentUi ? options : null;
      return fluent.Button(
        onPressed: widget.onPressed,
        style    : fluentOptions?.style,
        child    : widget.child,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaDatePicker>(
    naUiTypeFluent,
    (BuildContext context, NaDatePicker widget) {
      return fluent.DatePicker(
        selected : widget.initialDate,
        onChanged: widget.onDateChanged,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaTimePicker>(
    naUiTypeFluent,
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
            hours  : date.hour,
            minutes: date.minute,
          ));
        },
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaBottomNavigationBar>(
    naUiTypeFluent,
    (BuildContext context, NaBottomNavigationBar widget) {
      return fluent.Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children         : widget.items.asMap().entries.map((MapEntry<int, BottomNavigationBarItem> entry) {
          final int index = entry.key;
          final BottomNavigationBarItem item = entry.value;
          final bool isSelected = index == widget.currentIndex;
          return fluent.Button(
            onPressed: () {
              if (widget.onTap != null) {
                widget.onTap!(index);
              }
            },
            child: fluent.Column(
              mainAxisSize: MainAxisSize.min,
              children    : <Widget>[
                isSelected ? item.activeIcon : item.icon,
                if (item.label != null) fluent.Text(item.label!),
              ],
            ),
          );
        }).toList(),
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaRadio>(
    naUiTypeFluent,
    (BuildContext context, NaRadio widget) {
      final NaRadioOptions? options = widget.optionsBuilder?.call(context, naUiTypeFluent);
      final NaRadioOptionsFluentUi? fluentOptions = options is NaRadioOptionsFluentUi ? options : null;
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

  naPlatformServiceRegisterWidgetBuilder<NaTextField>(
    naUiTypeFluent,
    (BuildContext context, NaTextField widget) {
      final NaTextFieldOptions? options = widget.optionsBuilder?.call(context, naUiTypeFluent);
      final NaTextFieldOptionsFluentUi? fluentOptions = options is NaTextFieldOptionsFluentUi ? options : null;
      return fluent.TextBox(
        controller      : widget.controller,
        obscureText     : widget.obscureText,
        onChanged       : widget.onChanged,
        style           : fluentOptions?.style,
        decoration      : fluentOptions?.decoration,
        placeholder     : fluentOptions?.placeholder,
        placeholderStyle: fluentOptions?.placeholderStyle,
        prefix          : fluentOptions?.prefix,
        suffix          : fluentOptions?.suffix,
        padding         : fluentOptions?.padding ?? const EdgeInsets.all(8.0),
        focusNode       : fluentOptions?.focusNode,
        autofocus       : fluentOptions?.autofocus ?? false,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaIcon>(
    naUiTypeFluent,
    (BuildContext context, NaIcon widget) {
      return fluent.Icon(
        widget.icon.platformIcons[naUiTypeFluent] ?? widget.icon.defaultIcon,
        size : widget.size,
        color: widget.color,
      );
    },
  );
}
