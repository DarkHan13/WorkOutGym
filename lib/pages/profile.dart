import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:work_out_gym/pages/Read%20Data%20Componenets/get_user_avatar.dart';
import 'package:work_out_gym/pages/Read%20Data%20Componenets/get_user_fullname.dart';
import 'package:work_out_gym/pages/profile/profile_images.dart';
import 'package:work_out_gym/pages/select_photo_option_screen.dart';

class UserProfile extends StatefulWidget {
  UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  File? _image;
  String? _imageURL;
  final user = FirebaseAuth.instance.currentUser!;

  DatabaseReference? dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('users');
  }





  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  Future updateUserImage(String newImageURL) async {
    DatabaseReference usersRef =
        FirebaseDatabase.instance.reference().child('users/${user.uid}');
    Map<String, String> dataToSend= {
      'imageURL': newImageURL,
    };
    await usersRef.update(dataToSend);

    // Query query = userRef.orderByChild("email").equalTo(user.email);

    // try {
    //   DataSnapshot data = await query.get();
    //   // Get the key of the user from the snapshot
    //   String userKey = snapshot.value.keys.first;
    //
    //   // Create a reference to the specific user node using the retrieved key
    //   DatabaseReference userRef = usersRef.child(userKey);
    //
    //   // Update the user information
    //   await userRef.update({
    //     'displayName': displayName,
    //     'photoUrl': photoUrl,
    //   });
    //
    //     print('User information updated successfully');
    // } catch (e) {
    //   print('Error updating user information: $e');
    // }
  }


  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      String uid = DateTime.now().millisecondsSinceEpoch.toString();

      // Get a reference to storage root
      Reference refRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = refRoot.child('images');

      // Create a ref for image to be stored
      Reference refImageToUpload = referenceDirImages.child(uid);

      // Store the file

      await refImageToUpload.putFile(File(image!.path));
      print("IMAGEURL");
      var newImageURL = await refImageToUpload.getDownloadURL();
      print("UPLOADED SSSSSSSSSSSSS");
      await updateUserImage(newImageURL);
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
                child: GetUserAvatar(),
              ),
              const SizedBox(height: 10),
              GetUserFullname(email: user.email!),
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



