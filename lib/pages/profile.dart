import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:work_out_gym/pages/profile/profile_images.dart';
import 'package:work_out_gym/pages/select_photo_option_screen.dart';

class UserProfile extends StatefulWidget {
  UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  File? _image;
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }


  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) =>
          DraggableScrollableSheet(
              initialChildSize: 0.28,
              maxChildSize: 0.4,
              minChildSize: 0.28,
              expand: false,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: SelectPhotoOptionsScreen(
                    onTap: _pickImage,
                  ),
                );
              }),
    );
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

              GestureDetector(
                onTap: () => _showSelectPhotoOptions(context),
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade200,
                  ),
                  child: _image == null
                      ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                          'No image',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                  ),
                        ),
                      )
                      :
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: FileImage(_image!),
                  ),
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

List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: Icons.insights,
    title: "История прогресса",
    onTap: (context) {},
  ),
  CustomListTile(
    icon: Icons.photo_camera_outlined,
    title: "Фотографии",
    onTap: (context) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProfileImages()));
    },
  ),
  CustomListTile(
    title: "Настройки",
    icon: CupertinoIcons.settings,
    onTap: (context) {},
  ),
  CustomListTile(
    title: "Выйти",
    icon: CupertinoIcons.escape,
    onTap: (context) {
      FirebaseAuth.instance.signOut();
    },
  ),
];



