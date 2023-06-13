import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_out_gym/translations/locale_keys.g.dart';
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
        title: Text(LocaleKeys.Settings.tr()),
      ),
      body: ListView(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              themeProvider.toggleTheme(ThemeName.light);
            },
            child: Text(LocaleKeys.Light_Theme.tr()),
          ),
          ElevatedButton(
            onPressed: () {
              themeProvider.toggleTheme(ThemeName.dark);
            },
            child: Text(LocaleKeys.Dark_Theme.tr()),
          ),
          ElevatedButton(
            onPressed: () {
              themeProvider.toggleTheme(ThemeName.defaultTheme);
            },
            child: Text(LocaleKeys.Default_Theme.tr()),
          ),

          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              context.setLocale(Locale('ru'));
            },
            child: Text(LocaleKeys.Russian.tr()),
          ),
          ElevatedButton(
            onPressed: () {
              context.setLocale(Locale('en'));
            },
            child: Text(LocaleKeys.English.tr()),
          ),
          ElevatedButton(
            onPressed: () {
              context.setLocale(Locale('kk'));
            },
            child: Text(LocaleKeys.Kazakh.tr()),
          ),

        ],
      ),
    );
  }
}