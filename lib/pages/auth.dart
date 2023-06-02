import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:work_out_gym/homepage.dart';
import 'package:work_out_gym/pages/login.dart';

import 'login_or_register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:  (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return const HomePage();
          }
          // user is NOT logged in
          else {
            return const LoginOrRegisterPage();
          }
        },
      )
    );
  }
}
