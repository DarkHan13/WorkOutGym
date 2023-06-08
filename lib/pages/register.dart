import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:work_out_gym/components/dh_button.dart';
import 'package:work_out_gym/components/dh_textField.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:work_out_gym/firebase_options.dart';
import 'package:work_out_gym/translations/locale_keys.g.dart';

import '../services/auth_services.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();

  DatabaseReference? dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('users');
  }

  // navigate to login page
  void navigateToLogin() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)
    {
      return LoginPage(onTap: () {});
    }));
  }

  // sign user function
  void signUserUp() async {

    if (passwordController.text != passwordConfirmController.text) {
      // show error message
      showErrorMessage("Password don't match!");
      return;
    }

    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign up
    try {
      // create user
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );
      // add user details
      addUserDetails(
          firstnameController.text.trim(),
          lastnameController.text.trim(),
          emailController.text.trim(),
          userCredential.user!.uid,

      );


      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      showErrorMessage(e.code);
    }
  }

  Future addUserDetails(
      String firstname, String lastname,
      String email, String uid
      ) async {
    DatabaseReference newRef = dbRef!.child(uid);
    Map<String, String> dataToSend= {
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'imageURL': ''
    };
    await newRef!.set(dataToSend);
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false, // set it to false
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),

                  // Let's create an account for you!
                  Text(
                    LocaleKeys.Already_have_an_account.tr(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // firstname textfield
                  DHTextField(
                    controller: firstnameController,
                    hintText: LocaleKeys.Name.tr(),
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // lastname textfield
                  DHTextField(
                    controller: lastnameController,
                    hintText: LocaleKeys.Lastname.tr(),
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // email textfield
                  DHTextField(
                    controller: emailController,
                    hintText: LocaleKeys.Email.tr(),
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // password textfield
                  DHTextField(
                    controller: passwordController,
                    hintText: LocaleKeys.Password.tr(),
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  // confirm password textfield
                  DHTextField(
                    controller: passwordConfirmController,
                    hintText: LocaleKeys.Confirm_Password.tr(),
                    obscureText: true,
                  ),


                  const SizedBox(height: 20),

                  // sign in btn
                  DHButton(onTap: signUserUp, text: LocaleKeys.Sign_up.tr()),

                  const SizedBox(height: 20),

                  // or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            LocaleKeys.Or_continue_with.tr(),
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // google sign in button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          AuthService().signInWithGoogle();
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey[200],
                          ),
                          child: Image.asset('lib/images/google.png', height: 40),
                        ),
                      ),
                    ],
                  ),


                  const SizedBox(height: 25),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.Already_have_an_account,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap!,
                        child: const Text(LocaleKeys.Login_now,
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
