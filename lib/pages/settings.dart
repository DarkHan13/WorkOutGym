import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
        ],
      ),
    );
  }

}