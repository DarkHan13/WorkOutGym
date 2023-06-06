import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: ListView(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              themeProvider.toggleTheme(ThemeName.light);
            },
            child: const Text('светлая тема'),
          ),
          ElevatedButton(
            onPressed: () {
              themeProvider.toggleTheme(ThemeName.dark);
            },
            child: const Text('темная тема'),
          ),
          ElevatedButton(
            onPressed: () {
              themeProvider.toggleTheme(ThemeName.defaultTheme);
            },
            child: const Text('тема по умолчанию'),
          ),
        ],
      ),
    );
  }
}