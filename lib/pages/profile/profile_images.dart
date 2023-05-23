import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:work_out_gym/components/dh_button.dart';

import '../select_photo_option_screen.dart';

class ProfileImages extends StatefulWidget {
  const ProfileImages({Key? key}) : super(key: key);

  @override
  State<ProfileImages> createState() => _ProfileImagesState();
}

class _ProfileImagesState extends State<ProfileImages> {
  File? _image;

  String imageURL = 'as';

  DatabaseReference? dbRef;
  CollectionReference? _reference;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('profile_images');
    _reference =
        FirebaseFirestore.instance.collection('profile_images');
  }

  Future _pickImage(ImageSource source) async {
    try {

      print("START PICKING");
      XFile? image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      String uid = DateTime.now().millisecondsSinceEpoch.toString();

      // Get a reference to storage root
      Reference refRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = refRoot.child('images');

      // Create a ref for image to be stored
      Reference refImageToUpload = referenceDirImages.child(uid);

      // Store the file
      try {
        refImageToUpload.putFile(File(image!.path));
        print("IMAGEURL");
        imageURL = await refImageToUpload.getDownloadURL();
        print("UPLOADED SSSSSSSSSSSSS");
      } on Exception catch (e) {
        print(e.toString());
      }

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

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            message,
            style: const TextStyle(color: Colors.red),
          ),
        );
      },
    );
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
      builder: (context) => DraggableScrollableSheet(
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20,),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.5625,
                  ),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                        onPressed: () {
                          _showSelectPhotoOptions(context);
                        },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                         /* image: DecorationImage(
                            image: FileImage(_image!),
                            fit: BoxFit.cover,
                          ),*/
                        ),
                      ),
                    );
                  }, itemCount: 10,
                ),
              ),
            ),
          DHButton(
              onTap: () {
                /*if (imageURL.isEmpty) {
                  showErrorMessage("No image found");

                  return;
                }

                String email = "def";
                email = FirebaseAuth.instance.currentUser!.email!;
                Map<String, String> dataToSend= {
                  'email': email,
                  'image': imageURL
                };
                print(dataToSend);
                _reference?.add(dataToSend);*/

                uploadFile();
              },
              text: "A $imageURL")

          ],
        )
      ),
    );
  }

  uploadFile() async {
    var email = FirebaseAuth.instance.currentUser!.email!;
    Map<String, String> dataToSend= {
      'email': email,
      'image': imageURL
    };

    dbRef!.push().set(dataToSend).whenComplete(() {
      showErrorMessage("Done");
    });
  }

}
