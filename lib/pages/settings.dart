import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'.tr),
      ),
      body: ListView(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              // TODO: implement theme switching
            },
            child: Text('Light_Theme'.tr),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: implement theme switching
            },
            child: Text('Dark_Theme'.tr),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: implement theme switching
            },
            child: Text('Default_Theme'.tr),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              Get.updateLocale(const Locale('ru', 'RU'));
            },
            child: Text('Russian'.tr),
          ),
          ElevatedButton(
            onPressed: () {
              Get.updateLocale(const Locale('en', 'UK'));
            },
            child: Text('English'.tr),
          ),
          ElevatedButton(
            onPressed: () {
              Get.updateLocale(const Locale('kk', 'KK'));
            },
            child: Text('Kazakh'.tr),
          ),

        ],
      ),
    );
  }
}