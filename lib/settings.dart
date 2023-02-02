import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/settings_data.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Instellingen')),
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text('Switch theme'),
              trailing: Switch(
                value: context.watch<SettingsData>().isDarkMode(),
                onChanged: (bool value) {
                  context.read<SettingsData>().toggleTheme(value);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
