import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF242328),
        title: const Text("Профиль"),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF1c1c1e),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://kartinkof.club/uploads/posts/2022-09/1662325054_2-kartinkof-club-p-novie-i-krasivie-kartinki-kachok-4.jpg",
                ),
              ),
              const SizedBox(height: 10),
              Text(
                user.email != null ? user.email! : "Загрзука",
                style: const TextStyle(
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
                  onTap: tile.onTap,
                  child: Card(
                    color: Colors.blue,
                    elevation: 4,
                    shadowColor: Colors.white12,
                    child: ListTile(
                      leading: Icon(
                        tile.icon,
                        color: Colors.white,
                      ),
                      title: Text(tile.title),
                      trailing:
                          const Icon(Icons.chevron_right, color: Colors.white),
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
  final void Function() onTap;

  CustomListTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}

List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: Icons.insights,
    title: "История прогресса",
    onTap: () {},
  ),
  CustomListTile(
    icon: Icons.photo_camera_outlined,
    title: "Фотографии",
    onTap: () {},
  ),
  CustomListTile(
    title: "Настройки",
    icon: CupertinoIcons.settings,
    onTap: () {},
  ),
  CustomListTile(
    title: "Выйти",
    icon: CupertinoIcons.escape,
    onTap: () {
      FirebaseAuth.instance.signOut();
    },
  ),
];
