import 'package:bulleted_list/bulleted_list.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:work_out_gym/pages/meal.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DryingBreakfast extends StatefulWidget {
  const DryingBreakfast({super.key});

  @override
  State<DryingBreakfast> createState() => _DryingBreakfastState();
}

class _DryingBreakfastState extends State<DryingBreakfast> {
  @override
  Widget build(BuildContext context) {
    int _currentPageIndex = 0;
    PageController _pageController = PageController();

    return Scaffold(
      backgroundColor: const Color(0xFF1c1c1e),
      appBar: AppBar(
        backgroundColor: const Color(0xFF242328),
        title: const Text('Сушка: Завтрак'),
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = 0;
              });
            },
            controller: _pageController,
            children: const <Widget>[
              Meal(
                  videoId: 'pXxnjW0LvP8',
                  name: 'Яичница с беконом',
                  ingredients: [
                    'яйца куриные',
                    'лук',
                    'бекон',
                    'сосиски',
                    'сыр',
                  ],
              ),
              SecondMeal(),
              ThirdMeal(),
              FourthMeal(),
            ],
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

class SecondMeal extends StatefulWidget {
  const SecondMeal({super.key});

  @override
  State<SecondMeal> createState() => _SecondMealState();
}

class _SecondMealState extends State<SecondMeal> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'p4ls3IqHydw',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        YoutubePlayer(controller: _controller),
        const Text(
          'Фруктовые мюсли',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        const Text(
          'Ингридиенты',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        const BulletedList(
          style: TextStyle(
            color: Colors.white,
          ),
          bulletColor: Colors.white,
          listItems: [
            'сушеные фрукты',
            'теплая вода',
            'молоко',
          ],
        ),
      ],
    );
  }
}

class ThirdMeal extends StatefulWidget {
  const ThirdMeal({super.key});

  @override
  State<ThirdMeal> createState() => _ThirdMealState();
}

class _ThirdMealState extends State<ThirdMeal> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'iBDd1mMzzIQ',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        YoutubePlayer(controller: _controller),
        const Text(
          'Банановые чипсы с йогуртом',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        const Text(
          'Ингридиенты',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        const BulletedList(
          style: TextStyle(
            color: Colors.white,
          ),
          bulletColor: Colors.white,
          listItems: [
            'сушеные бананы',
            'йогурт',
            'свежие ягоды',
          ],
        ),
      ],
    );
  }

}

class FourthMeal extends StatefulWidget {
  const FourthMeal({super.key});

  @override
  State<FourthMeal> createState() => _FourthMealState();
}

class _FourthMealState extends State<FourthMeal> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'OfUSaV3yp58',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        YoutubePlayer(controller: _controller),
        const Text(
          'Овсяные печенья',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        const Text(
          'Ингридиенты',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        const BulletedList(
          style: TextStyle(
            color: Colors.white,
          ),
          bulletColor: Colors.white,
          listItems: [
            'овсяные хлопья',
            'изюм',
            'кокосова стружка',
            'мед',
            'растительное масло',
          ],
        ),
      ],
    );
  }

}