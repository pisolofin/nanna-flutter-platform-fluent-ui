import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

/// Registers the NaBottomNavigationBar builder for Fluent UI.
void registerNaBottomNavigationBarFluentUi(NaUiType uiType) {
  naPlatformServiceRegisterWidgetBuilder<NaBottomNavigationBar>(
    uiType,
    (BuildContext context, NaBottomNavigationBar widget) {
      return fluent.Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children         : widget.items
            .asMap()
            .entries
            .map((MapEntry<int, BottomNavigationBarItem> entry) {
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
                // Item icon
                isSelected ? item.activeIcon : item.icon,
                // Item label
                if (item.label != null) ...<Widget>[
                  fluent.Text(item.label!),
                ],
              ],
            ),
          );
        }).toList(),
      );
    },
  );
}
