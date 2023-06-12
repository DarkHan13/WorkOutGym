import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out_gym/pages/profile/profile_images.dart';
import 'package:work_out_gym/pages/settings.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  List<CustomListTile> customListTiles = [
    CustomListTile(
      icon: Icons.insights,
      title: 'Progress'.tr,
      onTap: (context) {},
    ),
    CustomListTile(
      icon: Icons.photo_camera_outlined,
      title: 'Photos'.tr,
      onTap: (context) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ProfileImages()));
      },
    ),
    CustomListTile(
      title: 'Settings'.tr,
      icon: CupertinoIcons.settings,
      onTap: (context) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Settings(),
          ),
        );
      },
    ),
    CustomListTile(
      title: 'Exit'.tr,
      icon: CupertinoIcons.escape,
      onTap: (context) {
        FirebaseAuth.instance.signOut();
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Profile'.tr),
        centerTitle: true,
      ),
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
                user.email != null ? user.email! : 'Loading'.tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text("")
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
                  onTap: () {
                      tile.onTap(context);
                  },
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
  final void Function(BuildContext) onTap;

  CustomListTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}


