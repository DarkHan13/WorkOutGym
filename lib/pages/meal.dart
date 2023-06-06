import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Meal extends StatefulWidget {
  const Meal({
    super.key,
    required this.videoId,
    required this.name,
    required this.ingredients
  });

  final String videoId;
  final String name;
  final List<String> ingredients;

  @override
  State<Meal> createState() => _MealState();
}

class _MealState extends State<Meal> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
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
        Text(widget.name),
        const Text('Ингридиенты'),
        BulletedList(
          style: const TextStyle(
            color: Colors.white,
          ),
          bulletColor: Colors.white,
          listItems: widget.ingredients,
        ),
      ],
    );
  }

}