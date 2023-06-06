import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:work_out_gym/pages/nutrition/meal.dart';

class FourMeal extends StatefulWidget {
  const FourMeal({
    super.key,
    required this.title,
    required this.meals,
  });

  final String title;
  final List<Meal> meals;

  @override
  State<FourMeal> createState() => _FourMealState();
}

class _FourMealState extends State<FourMeal> {
  final int _currentPageIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            children: widget.meals,
          ),
          Positioned(
            bottom: 16.0,
            right: 1.0,
            left: 1.0,
            child: DotsIndicator(
              dotsCount: 4,
              position: _currentPageIndex,
              decorator: const DotsDecorator(
                color: Colors.grey, // Color of the dots
                activeColor: Colors.blue, // Color of the active dot
              ),
            ),
          ),
        ],
      ),
    );
  }
}