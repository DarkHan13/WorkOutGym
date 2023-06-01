import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class GetUserAvatar extends StatelessWidget {
  const GetUserAvatar({Key? key}) : super(key: key);


  Future<String?> getUserImageUrl() async {
    print("asdadwaasSTART");

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userRef = FirebaseDatabase.instance.ref().child('users/${user.uid}');
      final dataSnapshot = await userRef.once();
      print("asdadwaasSTART");
      if (dataSnapshot.snapshot.value == null) return null;
      print(dataSnapshot.snapshot.value);
      print("asdadw");
      Map<Object?, Object?> data = dataSnapshot.snapshot.value as Map<Object?, Object?>;
      return data['imageURL'] as String?;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getUserImageUrl(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while retrieving data
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle any errors that occurred during data retrieval
          return Text('Error: ${snapshot.error}');
        } else {
          final imageUrl = snapshot.data;
          // Display the image or a default "No Image" placeholder
          if (imageUrl != null && imageUrl.isNotEmpty) {
            return CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 70, // Customize the size of the avatar
            );
          } else {
            return const CircleAvatar(
              child: Text('No Image'),
              radius: 70, // Customize the size of the avatar
            );
          }
        }
      },
    );
  }
}
