import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class UserNutrition extends StatelessWidget{
  const UserNutrition({super.key});

  @override
  Widget build(BuildContext context){
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: const Color(0xFF1c1c1e),
          appBar: AppBar(
            backgroundColor: const Color(0xFF242328),
            title: const Text('Питание'),
            centerTitle: true,
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(text: 'Сушка'),
                Tab(text: 'Масса'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Drying(),
              const Center(
                child: Text('Масса'),
              ),
            ],
          ),
        )
    );
  }
}

class Drying extends StatefulWidget {
  @override
  _DryingState createState() => _DryingState();
}

class _DryingState extends State<Drying> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: 'dQw4w9WgXcQ',
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
        const Text('Если твоя цель сжечь жир и добиться максимального рельефа мышц , этот рацион для тебя'),
        const Divider(
          color: Colors.white,
        ),
        const Text('Выберите меню'),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: NetworkImage('https://www.eatingwell.com/thmb/m5xUzIOmhWSoXZnY-oZcO9SdArQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/article_291139_the-top-10-healthiest-foods-for-kids_-02-4b745e57928c4786a61b47d8ba920058.jpg'),
              height: 100,
            ),
            Image(
              image: NetworkImage('https://www.eatingwell.com/thmb/m5xUzIOmhWSoXZnY-oZcO9SdArQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/article_291139_the-top-10-healthiest-foods-for-kids_-02-4b745e57928c4786a61b47d8ba920058.jpg'),
              height: 100,
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: NetworkImage('https://www.eatingwell.com/thmb/m5xUzIOmhWSoXZnY-oZcO9SdArQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/article_291139_the-top-10-healthiest-foods-for-kids_-02-4b745e57928c4786a61b47d8ba920058.jpg'),
              height: 100,
            ),
            Image(
              image: NetworkImage('https://www.eatingwell.com/thmb/m5xUzIOmhWSoXZnY-oZcO9SdArQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/article_291139_the-top-10-healthiest-foods-for-kids_-02-4b745e57928c4786a61b47d8ba920058.jpg'),
              height: 100,
            ),
          ],
        ),
      ],
    );
  }

}