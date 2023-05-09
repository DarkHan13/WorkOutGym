import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:work_out_gym/pages/goals.dart';
import 'package:work_out_gym/pages/nutrition.dart';
import 'package:work_out_gym/pages/profile.dart';
import 'package:work_out_gym/pages/tips.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}): super(key: key);

  @override
  _HomePageState createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int _selectedIndex = 0;

  void _navigateBottomBar(int index){
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
  Widget build(BuildContext context){
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.align_horizontal_left), label: 'Цели'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined), label: 'Питание'),
          BottomNavigationBarItem(icon: Icon(Icons.tips_and_updates), label: 'Советы'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
        ],
      ),
    );
  }
}