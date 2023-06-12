import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out_gym/pages/nutrition/drying_breakfast.dart';
import 'package:work_out_gym/pages/nutrition/drying_dinner.dart';
import 'package:work_out_gym/pages/nutrition/drying_lunch.dart';
import 'package:work_out_gym/pages/nutrition/drying_snacks.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class UserNutrition extends StatelessWidget{
  const UserNutrition({super.key});

  @override
  Widget build(BuildContext context){
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Nutrition'.tr),
            centerTitle: true,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(child: Text(
                    'Fat_loss'.tr,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor, // Set the desired text color
                  ),
                )),
                Tab(child: Text(
                  'Bulking'.tr,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor, // Set the desired text color
                  ),
                )),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Drying(),
              Mass(),
            ],
          ),
        )
    );
  }
}

class Drying extends StatefulWidget {
  const Drying({super.key});

  @override
  State<Drying> createState() => _DryingState();
}

class _DryingState extends State<Drying> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: 'h8fWfE15sRs',
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
        Text('If_your_goal_is_to_burn_fat_achieve_maximum_muscle_relief_you'.tr),
        const Divider(
          color: Colors.white,
        ),
        Text('Select_menu'.tr),
        const DryingMenu(),
      ],
    );
  }

}

class DryingMenu extends StatelessWidget {
  const DryingMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 1.3,
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return const DryingBreakfast();
              }),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ListView(
              children: <Widget>[
                const Image(
                  image: NetworkImage('https://royal-forest.ru/upload/medialibrary/18a/18ada7d94e777cd8cf984b46ee146b82.jpg'),
                ),
                Text('Breakfast'.tr),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return const DryingSnacks();
              })
            );
          },
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ListView(
              children: <Widget>[
                Image(
                  image: NetworkImage('https://i.ytimg.com/vi/ttyE6LNnNFc/maxresdefault.jpg'),
                ),
                Text('Snack'.tr),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return const DryingLunch();
              })
            );
          },
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ListView(
              children: <Widget>[
                Image(
                  image: NetworkImage('https://levgon.ru/wp-content/uploads/2014/02/%D0%B3%D1%80%D1%83%D0%B4%D0%BA%D0%B0-%D1%81-%D1%80%D0%B8%D1%81%D0%BE%D0%BC.jpg'),
                ),
                Text('Lunch'.tr),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return const DryingDinner();
              })
            );
          },
          child: Container(
              margin: const EdgeInsets.all(5.0),
              child: ListView(
                children: <Widget>[
                  Image(
                    image: NetworkImage('https://ggym.ru/wp-content/uploads/2018/12/egg.jpg'),
                  ),
                  Text('Dinner'.tr)
                ],
              )
          ),
        ),
      ],
    );
  }
}

class Mass extends StatefulWidget {
  const Mass({super.key});

  @override
  State<Mass> createState() => _MassState();
}

class _MassState extends State<Mass> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'h8fWfE15sRs',
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
        Text('If_your_goal_is_to_gain_mass_and_achieve_muscle_volume_you'.tr),
        const Divider(
          color: Colors.white,
        ),
        Text('Select_menu'.tr),
        const MassMenu(),
      ],
    );
  }
}

class MassMenu extends StatelessWidget {
  const MassMenu({super.key});

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
            children: <Widget>[
              const Image(
                image: NetworkImage('https://avatars.dzeninfra.ru/get-zen_doc/4581052/pub_60241e38a06a2a6c7a447244_60241e90a06a2a6c7a453633/scale_1200'),
              ),
              Text('Breakfast'.tr),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          child: ListView(
            children: <Widget>[
              const Image(
                image: NetworkImage('https://donsport.ru/upload/blog/racion-pitaniya-pri-nabore-vesa.jpg'),
              ),
              Text('Snack'.tr),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          child: ListView(
            children: <Widget>[
              const Image(
                image: NetworkImage('https://mrdjemiuszero.com/upload/iblock/764/ht8v2twxew4v1e190koklztt45vdav5t.jpg'),
              ),
              Text('Lunch'.tr),
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.all(5.0),
            child: ListView(
              children: <Widget>[
                const Image(
                  image: NetworkImage('https://www.justfood.pro/blog/wp-content/uploads/2022/03/308a5f8d-8270-45ab-bde0-8b90e6dc2d361.jpg'),
                ),
                Text('Dinner'.tr)
              ],
            )
        )
      ],
    );
  }

}