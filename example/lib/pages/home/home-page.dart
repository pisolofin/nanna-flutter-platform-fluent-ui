import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

import 'package:nanna_platform/nanna_platform.dart';
import 'package:nanna_flutter_platform_fluent_ui/nanna-flutter-platform-fluent-ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _switchValue = false;
  bool _checkboxValue = false;
  double _sliderValue = 50.0;
  String _radioValue = 'Option 1';
  int _bottomNavIndex = 0;
  final TextEditingController _textController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  Duration _selectedDuration = const Duration(hours: 12, minutes: 30);

  void _onSwitchChanged(bool value) {
    setState(() {
      _switchValue = value;
    });
  }

  void _onCheckboxChanged(bool? value) {
    setState(() {
      _checkboxValue = value ?? false;
    });
  }

  void _onSliderChanged(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  void _onRadioChanged(dynamic value) {
    setState(() {
      _radioValue = value as String;
    });
  }

  void _onDateChanged(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  void _onDurationChanged(Duration duration) {
    setState(() {
      _selectedDuration = duration;
    });
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  Future _showDialogAsync() async {
    await fluent.showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return NaAlertDialog(
          title: const Text('Hello Fluent'),
          content: const Text('This is an example dialog using Fluent UI.'),
          actions: <Widget>[
            NaDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return NaScaffold(
      appBar: NaAppBar(
        title: const Text('Fluent UI Integration Example'),
        actions: <Widget>[
          NaIconButton(
            icon: const NaIcon(NaIconData(fluent.FluentIcons.settings)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('NaButton & NaIconButton:'),
              const SizedBox(height: 8.0),
              Row(
                children: <Widget>[
                  NaButton(
                    onPressed: _showDialogAsync,
                    child: const Text('Show Dialog'),
                  ),
                  const SizedBox(width: 16.0),
                  NaIconButton(
                    icon: const NaIcon(NaIconData(fluent.FluentIcons.add)),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text('NaTextField:'),
              const SizedBox(height: 8.0),
              NaTextField(
                controller: _textController,
                optionsBuilder: (BuildContext ctx, NaUiType uiType) {
                  return NaTextFieldOptionsFluentUi(
                    placeholder: 'Type something...',
                  );
                },
              ),
              const SizedBox(height: 16.0),
              const Text('NaSwitch & NaCheckbox:'),
              const SizedBox(height: 8.0),
              Row(
                children: <Widget>[
                  NaSwitch(value: _switchValue, onChanged: _onSwitchChanged),
                  const SizedBox(width: 32.0),
                  NaCheckbox(
                    value: _checkboxValue,
                    onChanged: _onCheckboxChanged,
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text('NaSlider:'),
              const SizedBox(height: 8.0),
              NaSlider(
                value: _sliderValue,
                min: 0.0,
                max: 100.0,
                onChanged: _onSliderChanged,
              ),
              const SizedBox(height: 16.0),
              const Text('NaRadio:'),
              const SizedBox(height: 8.0),
              Row(
                children: <Widget>[
                  NaRadio(
                    value: 'Option 1',
                    groupValue: _radioValue,
                    onChanged: _onRadioChanged,
                  ),
                  const SizedBox(width: 8.0),
                  const Text('Option 1'),
                  const SizedBox(width: 16.0),
                  NaRadio(
                    value: 'Option 2',
                    groupValue: _radioValue,
                    onChanged: _onRadioChanged,
                  ),
                  const SizedBox(width: 8.0),
                  const Text('Option 2'),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text('NaProgressIndicator:'),
              const SizedBox(height: 8.0),
              const NaProgressIndicator(),
              const SizedBox(height: 16.0),
              const Text('NaCard & NaListTile:'),
              const SizedBox(height: 8.0),
              NaCard(
                child: NaListTile(
                  leading: const NaIcon(NaIconData(fluent.FluentIcons.contact)),
                  title: const Text('John Doe'),
                  subtitle: const Text('Software Engineer'),
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 16.0),
              const Text('NaDatePicker & NaTimePicker:'),
              const SizedBox(height: 8.0),
              Row(
                children: <Widget>[
                  NaDatePicker(
                    initialDate: _selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    onDateChanged: _onDateChanged,
                  ),
                  const SizedBox(width: 16.0),
                  NaTimePicker(
                    initialTimerDuration: _selectedDuration,
                    onTimerDurationChanged: _onDurationChanged,
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text('NaBottomNavigationBar:'),
              const SizedBox(height: 8.0),
              NaBottomNavigationBar(
                currentIndex: _bottomNavIndex,
                onTap: _onBottomNavTapped,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: NaIcon(NaIconData(fluent.FluentIcons.home)),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: NaIcon(NaIconData(fluent.FluentIcons.settings)),
                    label: 'Settings',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
