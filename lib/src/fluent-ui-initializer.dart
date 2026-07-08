import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:nanna_platform/nanna_platform.dart';

late final NaUiType naUiTypeFluent;

void initNannaPlatformFluentUi() {
  naUiTypeFluent = naPlatformServiceRegisterUiType(
    styleId: 'fluent',
    uiType : 'fluent_ui',
  );

  naPlatformServiceRegisterWidgetBuilder<NaButton>(
    naUiTypeFluent,
    (BuildContext context, NaButton widget) {
      return fluent.Button(
        onPressed: widget.onPressed,
        child    : widget.child,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaAppBar>(
    naUiTypeFluent,
    (BuildContext context, NaAppBar widget) {
      return fluent.Container(
        height : 50.0,
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
      return fluent.NavigationView(
        titleBar: widget.appBar != null
            ? fluent.TitleBar(
                title: widget.appBar,
              )
            : null,
        content : widget.body ?? const fluent.SizedBox.shrink(),
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaApp>(
    naUiTypeFluent,
    (BuildContext context, NaApp widget) {
      return fluent.FluentApp(
        title                     : widget.title ?? '',
        home                      : widget.home,
        debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner ?? true,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaIconButton>(
    naUiTypeFluent,
    (BuildContext context, NaIconButton widget) {
      return fluent.IconButton(
        icon     : widget.icon,
        onPressed: widget.onPressed,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaSwitch>(
    naUiTypeFluent,
    (BuildContext context, NaSwitch widget) {
      return fluent.ToggleSwitch(
        checked  : widget.value,
        onChanged: widget.onChanged,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaCheckbox>(
    naUiTypeFluent,
    (BuildContext context, NaCheckbox widget) {
      return fluent.Checkbox(
        checked  : widget.value,
        onChanged: widget.onChanged,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaSlider>(
    naUiTypeFluent,
    (BuildContext context, NaSlider widget) {
      return fluent.Slider(
        value    : widget.value,
        onChanged: widget.onChanged,
        min      : widget.min ?? 0.0,
        max      : widget.max ?? 1.0,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaProgressIndicator>(
    naUiTypeFluent,
    (BuildContext context, NaProgressIndicator widget) {
      return const fluent.ProgressRing();
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaCard>(
    naUiTypeFluent,
    (BuildContext context, NaCard widget) {
      return fluent.Card(
        child: widget.child,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaListTile>(
    naUiTypeFluent,
    (BuildContext context, NaListTile widget) {
      return fluent.ListTile(
        leading  : widget.leading,
        title    : widget.title,
        subtitle : widget.subtitle,
        trailing : widget.trailing,
        onPressed: widget.onTap,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaAlertDialog>(
    naUiTypeFluent,
    (BuildContext context, NaAlertDialog widget) {
      return fluent.ContentDialog(
        title  : widget.title,
        content: widget.content,
        actions: widget.actions,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaDialogAction>(
    naUiTypeFluent,
    (BuildContext context, NaDialogAction widget) {
      return fluent.Button(
        onPressed: widget.onPressed,
        child    : widget.child,
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaDatePicker>(
    naUiTypeFluent,
    (BuildContext context, NaDatePicker widget) {
      return fluent.DatePicker(
        selected : widget.initialDate ?? DateTime.now(),
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
      return fluent.RadioGroup<dynamic>(
        groupValue: widget.groupValue,
        onChanged : widget.onChanged ?? (dynamic value) {},
        child     : fluent.RadioButton(
          value: widget.value,
        ),
      );
    },
  );

  naPlatformServiceRegisterWidgetBuilder<NaTextField>(
    naUiTypeFluent,
    (BuildContext context, NaTextField widget) {
      return fluent.TextBox(
        controller : widget.controller,
        obscureText: widget.obscureText,
        onChanged  : widget.onChanged,
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
