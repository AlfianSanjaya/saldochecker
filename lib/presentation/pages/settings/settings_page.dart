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
  void toggleTheme(BuildContext context, bool value) {
    BlocProvider.of<SettingsCubit>(context).toggleTheme(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsAppBarTitle),
        centerTitle: true,
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Column(
            children: [
              Card(
                  child: ListTile(
                leading: const Icon(Icons.dark_mode),
                title: Text(AppLocalizations.of(context)!.settingsTheme),
                trailing: Switch(
                  value: state.isDarkTheme,
                  onChanged: (bool value) {
                    toggleTheme(context, value);
                  },
                ),
              )),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.language),
                  title: Text(AppLocalizations.of(context)!.settingsLanguage),
                  trailing: DropdownButton(
                    value: state.locale.toString(),
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
                    onChanged: (String? value) {
                      BlocProvider.of<SettingsCubit>(context)
                          .toggleLocale(Locale(value!));
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
