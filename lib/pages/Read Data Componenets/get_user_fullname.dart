import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class GetUserFullname extends StatelessWidget {
  final String email;

  const GetUserFullname({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var users = FirebaseDatabase.instance.ref().child('users');

    return FutureBuilder(
        future: users.orderByChild("email").equalTo(email) .onValue.first,
        builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.data!.snapshot.value == null) return Text(email);
        Map<Object?, Object?> data = snapshot.data!.snapshot.value as Map<Object?, Object?>;
        Map<String, dynamic> innerData = (data.values.first as Map<Object?, Object?>).cast<String, dynamic>();
        if (innerData["firstname"] == "") return Text(email);
        return Text('${innerData["firstname"]} ${innerData["lastname"]}');
      } else if (snapshot.hasError) {
        return Text(email, style: const TextStyle(color: Colors.red),);
      }
      else {
        return const Text("Loading...");
      }
    }));
  }
}
