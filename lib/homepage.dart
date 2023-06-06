import 'package:flutter/material.dart';
import 'package:work_out_gym/pages/goals.dart';
import 'package:work_out_gym/pages/nutrition.dart';
import 'package:work_out_gym/pages/profile.dart';
import 'package:work_out_gym/pages/tips.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      backgroundColor: const Color(0xFF1c1c1e),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.align_horizontal_left, color: Colors.white),
              label: 'Цели',
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
    );
  }
}
