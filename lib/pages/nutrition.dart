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
              Drying(),
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
        DryingMenu(),
      ],
    );
  }

}

class DryingMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 1.3,
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(5.0),
          child: ListView(
            children: const <Widget>[
              Image(
                height: 120,
                fit: BoxFit.cover,
                image: NetworkImage('https://pbs.twimg.com/media/DP-NvcCW4AAMWw4?format=jpg&name=medium'),
              ),
              Text('Завтрак'),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          child: ListView(
            children: const <Widget>[
              Image(
                height: 120,
                fit: BoxFit.cover,
                image: NetworkImage('https://i.ytimg.com/vi/ttyE6LNnNFc/maxresdefault.jpg'),
              ),
              Text('Перекус'),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          child: ListView(
            children: const <Widget>[
              Image(
                height: 120,
                fit: BoxFit.cover,
                image: NetworkImage('https://levgon.ru/wp-content/uploads/2014/02/%D0%B3%D1%80%D1%83%D0%B4%D0%BA%D0%B0-%D1%81-%D1%80%D0%B8%D1%81%D0%BE%D0%BC.jpg'),
              ),
              Text('Обед'),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          child: ListView(
            children: const <Widget>[
              Image(
                height: 120,
                fit: BoxFit.cover,
                image: NetworkImage('https://ggym.ru/wp-content/uploads/2018/12/egg.jpg'),
              ),
              Text('Ужин')
            ],
          )
        )
      ],
    );
  }

}