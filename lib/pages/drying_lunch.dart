import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_out_gym/pages/meal.dart';

class DryingLunch extends StatefulWidget {
  const DryingLunch({super.key});

  @override
  State<DryingLunch> createState() => _DryingLunchState();
}

class _DryingLunchState extends State<DryingLunch> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1c1c1e),
      appBar: AppBar(
        backgroundColor: const Color(0xFF242328),
        title: const Text('Сушка: Обед'),
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            children: const <Widget>[
              Meal(
                  videoId: 'TS1D6bjpYSc',
                  name: 'Сушеные овощные чипсы с дипом',
                  ingredients: [
                    'морковь',
                    'свеклу',
                    'сладкий перец',
                    'гуакамоле',
                    'тахини',
                    'овощной салат'
                  ],
              ),
              Meal(
                  videoId: 'TMYEXOIWwdU',
                  name: 'Запеченый лосось с овощами',
                  ingredients: [
                    'филе лосося',
                    'лимонным соком',
                    'чесноком',
                    'солью',
                    'перцем',
                    'брокколи',
                    'цветная капуста',
                    'сладкий перец',
                  ])
            ],
          ),
        ],
      ),
    );
  }

}