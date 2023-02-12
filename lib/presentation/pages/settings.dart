import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/models/settings_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String _dropdownValue = 'nl';

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
    context.read<SettingsData>().setLocale(Locale(selectedValue!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsAppBarTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.dark_mode),
              title: Text(AppLocalizations.of(context)!.settingsTheme),
              trailing: Switch(
                value: context.watch<SettingsData>().isDarkMode(),
                onChanged: (bool value) {
                  context.read<SettingsData>().toggleTheme(value);
                },
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.language),
              title: Text(AppLocalizations.of(context)!.settingsLanguage),
              trailing: DropdownButton(
                value: _dropdownValue,
                items: [
                  DropdownMenuItem(
                      child: Text(
                          AppLocalizations.of(context)!.settingsLanguageNL),
                      value: 'nl'),
                  DropdownMenuItem(
                      child: Text(
                          AppLocalizations.of(context)!.settingsLanguageEN),
                      value: 'en'),
                ],
                onChanged: dropdownCallback,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
