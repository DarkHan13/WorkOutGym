import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:work_out_gym/pages/goals.dart';
import 'package:work_out_gym/pages/nutrition.dart';
import 'package:work_out_gym/pages/profile.dart';
import 'package:work_out_gym/pages/tips.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    UserGoals(),
    UserNutrition(),
    UserTips(),
    UserProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
        textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
        )
    ),
      child: Scaffold(
        body: _pages[_selectedIndex],
        backgroundColor: const Color(0xFF1c1c1e),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: const Color(0xFF242328),
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.red,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.yellow))),
          // sets the inactive color of the `BottomNavigationBar
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _navigateBottomBar,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.white70,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.align_horizontal_left, color: Colors.white),
                  label: 'Цели',
                  backgroundColor: Colors.red
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_basket_outlined, color: Colors.white),
                  label: 'Питание'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.tips_and_updates, color: Colors.white),
                  label: 'Советы'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.white),
                  label: 'Профиль'),
            ],
          ),
        ),
      ),
    );
  }
}
