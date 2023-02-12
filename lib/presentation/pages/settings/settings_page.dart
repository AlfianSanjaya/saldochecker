import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:saldochecker/presentation/pages/settings/cubit/settings_cubit.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _dropdownValue = 'nl';

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
    //context.read<SettingsData>().setLocale(Locale(selectedValue!));
    BlocProvider.of<SettingsCubit>(context)
        .toggleLocale(Locale(selectedValue!));
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
          // Card(
          //   child: ListTile(
          //     leading: const Icon(Icons.dark_mode),
          //     title: Text(AppLocalizations.of(context)!.settingsTheme),
          //     trailing: Switch(
          //       value: context.watch<SettingsData>().isDarkMode(),
          //       onChanged: (bool value) {
          //         context.read<SettingsData>().toggleTheme(value);
          //       },
          //     ),
          //   ),
          // ),
          BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return Card(
                  child: ListTile(
                leading: const Icon(Icons.dark_mode),
                title: Text(AppLocalizations.of(context)!.settingsTheme),
                trailing: Switch(
                  value: state.isDarkTheme,
                  onChanged: (bool value) {
                    toggleTheme(context, value);
                  },
                ),
              ));
            },
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.language),
              title: Text(AppLocalizations.of(context)!.settingsLanguage),
              trailing: DropdownButton(
                value: _dropdownValue, // TODO: fix dropdown bug
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

  void toggleTheme(BuildContext context, bool value) {
    BlocProvider.of<SettingsCubit>(context).toggleTheme(value);
  }
}
