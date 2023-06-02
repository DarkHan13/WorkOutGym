import 'package:bulleted_list/bulleted_list.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DryingSnacks extends StatefulWidget {
  const DryingSnacks({super.key});

  @override
  State<DryingSnacks> createState() => _DryingSnacksState();
}

class _DryingSnacksState extends State<DryingSnacks> {
  final PageController _pageController = PageController();
  final int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1c1c1e),
      appBar: AppBar(
        backgroundColor: const Color(0xFF242328),
        title: const Text('Сушка: Перекус'),
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            children: const <Widget>[
              FirstMeal(),
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

class FirstMeal extends StatefulWidget {
  const FirstMeal({super.key});

  @override
  State<FirstMeal> createState() => _FirstMealState();
}

class _FirstMealState extends State<FirstMeal> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'w_2UIG4Wyl0',
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
          'Сушеные овощные чипсы',
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
              'морковь',
              'свекла',
              'сладкий перец',
              'батат',
            ]
        ),
      ],
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
      initialVideoId: 'U2NtcQhQEB4',
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
          'Сушеные орехи и семена',
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
            'миндаль',
            'фундук',
            'грецкий орех',
            'подсолнечные семечки',
            'тыквенные семечки',
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
      initialVideoId: 'OoOyWPfS_4w',
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
          'Сушеные фруктовые рулетики',
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
            'изюм',
            'чернослив',
            'абрикосы',
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
      initialVideoId: 'VrSM_4vPVQY',
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
          'Сушеные морские водоросли',
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
          listItems: <Widget>[
            Text(
              'морские водоросли',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ],
        ),
      ],
    );
  }

}