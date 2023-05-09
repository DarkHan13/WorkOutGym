import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget{
  const UserProfile({super.key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Text("Профиль"),
        centerTitle: true,
      ),


      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Column(
            children: const [
              CircleAvatar(
                radius: 50,

                backgroundImage: NetworkImage(

                  "https://kartinkof.club/uploads/posts/2022-09/1662325054_2-kartinkof-club-p-novie-i-krasivie-kartinki-kachok-4.jpg",
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Жанторе Ермуханбетов",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("")
            ],
          ),



          const SizedBox(height: 35),
          ...List.generate(
            customListTiles.length,
                (index) {
              final tile = customListTiles[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: GestureDetector(
                  onTap: signUserOut,
                  child: Card(
                    elevation: 4,
                    shadowColor: Colors.black12,
                    child: ListTile(
                      leading: Icon(tile.icon),
                      title: Text(tile.title),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  ),
                ),
              );
            },
          )
        ],


      ),
    );
  }
}

class CustomListTile {
  final IconData icon;
  final String title;
  CustomListTile({
    required this.icon,
    required this.title,
  });
}

List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: Icons.insights,
    title: "История прогресса",
  ),
  CustomListTile(
    icon: Icons.photo_camera_outlined,
    title: "Фотографии",
  ),
  CustomListTile(
    title: "Настройки",
    icon: CupertinoIcons.settings,
  ),
  CustomListTile(
    title: "Выйти",
    icon: CupertinoIcons.escape,
  ),
];