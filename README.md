<p align="center">
  <img src="https://raw.githubusercontent.com/pisolofin/nanna-flutter-platform/main/.logo/nanna-platform-logo-transparent.png" alt="Nanna Platform Fluent UI Logo" width="200"/>
</p>

# nanna_platform_fluent_ui

Fluent UI platform extension for the [`nanna_platform`](https://github.com/pisolofin/nanna-flutter-platform) Flutter package, enabling Windows and Microsoft Fluent Design System styled widget rendering for cross-platform apps.

Instead of manually branching for Windows or desktop platforms (`if (Platform.isWindows) ...`) and duplicating widget trees with `fluent_ui` components, `nanna_platform_fluent_ui` registers Fluent UI builders into `nanna_platform`'s dynamic widget builder registry. Your generic `nanna_platform` widgets automatically translate into authentic Microsoft Fluent Design components.

## Visual Comparison
Below are code rendering Windows (fluent-ui).

<table align="center">
  <tr>
    <td><img src="https://raw.githubusercontent.com/pisolofin/nanna-flutter-platform-fluent-ui/feature-init/.doc/images/windows-A.png" width="300" /></td>
    <td><img src="https://raw.githubusercontent.com/pisolofin/nanna-flutter-platform-fluent-ui/feature-init/.doc/images/windows-B.png" width="300" /></td>
  </tr>
</table>

---

## Features

- 🪟 **Fluent UI Integration**: Automatically renders `nanna_platform` widgets into authentic Windows 11 / Fluent UI components powered by [`fluent_ui`](https://pub.dev/packages/fluent_ui).
- 🎨 **NaIcons Fluent Mapping**: Seamless mapping of 240+ unified `NaIcons` directly to native Microsoft `FluentIcons`.
- 🧩 **Options Builder Pattern**: Platform-specific customizations via type-safe marker interfaces (`NaButtonOptionsFluentUi`, `NaTextFieldOptionsFluentUi`, `NaAppOptionsFluentUi`, etc.).
- 🌐 **Scope-Driven**: Effortlessly activated in any part of the widget tree via `NaUiTypeScope(uiTypes: [naUiTypeFluent, ...])`.
- 🔌 **Decoupled Architecture**: Keeps your application code completely independent of desktop-specific UI packages.

---

## Supported Widgets Status

| Flutter Widget (Material) | Fluent UI Equivalent | Implemented | Component Name |
| --- | --- | :---: | --- |
| `MaterialApp` | `fluent.FluentApp` | ✅ | `NaApp` |
| `Scaffold` | `fluent.Scaffold` | ✅ | `NaScaffold` |
| `AppBar` | Header Bar / Back navigation | ✅ | `NaAppBar` |
| `ElevatedButton` | `fluent.Button` | ✅ | `NaButton` |
| `IconButton` | `fluent.IconButton` | ✅ | `NaIconButton` |
| `Switch` | `fluent.ToggleSwitch` | ✅ | `NaSwitch` |
| `Checkbox` | `fluent.Checkbox` | ✅ | `NaCheckbox` |
| `Slider` | `fluent.Slider` | ✅ | `NaSlider` |
| `CircularProgressIndicator` | `fluent.ProgressRing` | ✅ | `NaProgressIndicator` |
| `Card` | `fluent.Card` | ✅ | `NaCard` |
| `AlertDialog` | `fluent.ContentDialog` | ✅ | `NaAlertDialog` |
| `BottomNavigationBar` | Navigation Bar / `fluent.Row` | ✅ | `NaBottomNavigationBar` |
| `DatePicker` | `fluent.DatePicker` | ✅ | `NaDatePicker` |
| `TimePicker` | `fluent.TimePicker` | ✅ | `NaTimePicker` |
| `ListTile` | `fluent.ListTile` | ✅ | `NaListTile` |
| `Radio` | `fluent.RadioButton` | ✅ | `NaRadio` |
| `Icon` | `fluent.Icon` (`fluent.FluentIcons`) | ✅ | `NaIcon` |
| `Dialog Action` | `fluent.Button` | ✅ | `NaDialogAction` |
| `TextField` | `fluent.TextBox` | ✅ | `NaTextField` |

> 🎨 **Icons Mapping**: For the full mapping table of all 240+ icons mapped from `NaIcons` to `FluentIcons`, see [.doc/fluent-icons-mapping.md](.doc/fluent-icons-mapping.md).

---

## Getting Started

### 1. Add Dependencies

Add `nanna_platform`, `nanna_platform_fluent_ui`, and `fluent_ui` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  nanna_platform: ^1.1.0
  nanna_platform_fluent_ui:
    git:
      url: https://github.com/pisolofin/nanna-flutter-platform-fluent-ui.git
  fluent_ui: ^4.16.1
```

### 2. Import the Packages

```dart
import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:nanna_platform_fluent_ui/nanna_platform_fluent_ui.dart';
```

---

## How to Use the Library

### 1. Initialize the Plugin
Call `initNannaPlatformFluentUi()` in your `main()` before calling `runApp()`. This registers the widget builders and icon mappings in `nanna_platform`:

```dart
void main() {
  // Initialize Fluent UI bindings for Nanna Platform
  initNannaPlatformFluentUi();

  runApp(const MyApp());
}
```

### 2. Activate in `NaUiTypeScope`
Wrap your application (or a subtree) in `NaUiTypeScope` and include `naUiTypeFluent` in the priority list. You can dynamically set `naUiTypeFluent` as first priority on Windows, while keeping Material or Cupertino as fallbacks:

```dart
import 'dart:io' show Platform;
import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:nanna_platform_fluent_ui/nanna_platform_fluent_ui.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return NaUiTypeScope(
      uiTypes: <NaUiType>[
        // Prioritize Fluent UI on Windows, or use it globally
        if (Platform.isWindows) ...[
          naUiTypeFluent
        ],
        NaUiType.cupertino,
        NaUiType.material,
      ],
      child: const NaApp(
        title: 'Fluent UI Example',
        home : HomePage(),
      ),
    );
  }
}
```

### 3. Use Generic `NaPlatform` Widgets
Use standard `NaPlatform` widgets across your screens. When `naUiTypeFluent` is active, they will automatically render using Microsoft Fluent Design controls:

```dart
// Renders as a fluent.Button
NaButton(
  onPressed: () => print('Clicked!'),
  child    : const Text('Submit'),
);

// Renders as a fluent.TextBox
NaTextField(
  controller: textController,
);

// Renders as a fluent.ToggleSwitch
NaSwitch(
  value    : isEnabled,
  onChanged: (bool value) => setState(() => isEnabled = value),
);

// Renders as a fluent.ProgressRing
const NaProgressIndicator();
```

### 4. Platform-Specific Options (`optionsBuilder`)
Whenever you need specific Fluent UI configurations, pass them using `optionsBuilder` and `*OptionsFluentUi` classes:

```dart
NaTextField(
  controller    : textController,
  optionsBuilder: (BuildContext context, NaUiType uiType) {
    if (uiType == naUiTypeFluent) {
      return NaTextFieldOptionsFluentUi(
        placeholder: 'Search files or apps...',
        autofocus  : true,
      );
    }
    return null;
  },
);
```

You can also pass Fluent themes using `NaAppOptionsFluentUi`:

```dart
NaApp(
  title         : 'My Fluent App',
  home          : const HomePage(),
  optionsBuilder: (BuildContext context, NaUiType uiType) {
    if (uiType == naUiTypeFluent) {
      return NaAppOptionsFluentUi(
        themeMode: fluent.ThemeMode.system,
      );
    }
    return null;
  },
);
```

### 5. Native Fluent Icons with `NaIcons`
Use `NaIcon` with any `NaIcons` constant. `nanna_platform_fluent_ui` automatically translates the icon into its `fluent.FluentIcons` equivalent:

```dart
// Automatically renders as fluent.FluentIcons.settings
const NaIcon(NaIcons.settings)

// Automatically renders as fluent.FluentIcons.contact
const NaIcon(NaIcons.person)

// Automatically renders as fluent.FluentIcons.calendar
const NaIcon(NaIcons.calendarToday)
```

Check [.doc/fluent-icons-mapping.md](.doc/fluent-icons-mapping.md) for the complete list of 240+ mapped icons.

---

## Example App

An interactive sample application is available in the [`example/`](example/) directory demonstrating all supported widgets, inputs, dialogs, navigation, and icons in a Fluent UI desktop window.

To run the example on Windows:

```bash
cd example
flutter run -d windows
```

---

## Related Projects

- [`nanna`](https://github.com/pisolofin/nanna-flutter) - Core Flutter utilities, secure storage, notification services, and code formatting tools.
- [`nanna_platform`](https://github.com/pisolofin/nanna-flutter-platform) - Cross-platform UI abstractions with Material Design and Cupertino native bindings.

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
