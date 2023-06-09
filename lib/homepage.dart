import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_out_gym/pages/goals.dart';
import 'package:work_out_gym/pages/nutrition/nutrition.dart';
import 'package:work_out_gym/pages/profile.dart';
import 'package:work_out_gym/pages/tips.dart';
import 'package:work_out_gym/theme_provider.dart';
import 'package:work_out_gym/translations/locale_keys.g.dart';

import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const UserGoals(),
    const UserNutrition(),
    const UserTips(),
    UserProfile()
  ];

  Future<ThemeName> readThemeFromLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString('Theme') ?? ThemeName.dark.toString();
    ThemeName parsedEnum =  EnumParser.parse(value, ThemeName.values) ?? ThemeName.dark;
    return parsedEnum;
  }

  void performSetup(ThemeProvider themeProvider) async {
    // Function to perform setup or initialization tasks
    // This function will be called at the start of the build method
    // Add your logic here
    ThemeName name = await readThemeFromLocalStorage();
    themeProvider.toggleTheme(name);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    //performSetup(themeProvider);

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.align_horizontal_left),
              label: LocaleKeys.Goals.tr(),
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_basket_outlined),
              label: LocaleKeys.Nutrition.tr()
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.tips_and_updates),
              label: LocaleKeys.Tips.tr(),
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: LocaleKeys.Profile.tr(),
          ),
        ],
      ),
    );
  }
}
