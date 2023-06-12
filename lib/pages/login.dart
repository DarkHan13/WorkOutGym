import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:work_out_gym/components/dh_button.dart';
import 'package:work_out_gym/components/dh_textField.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:work_out_gym/firebase_options.dart';
import 'package:work_out_gym/pages/register.dart';
import 'package:work_out_gym/services/auth_services.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // navigate to register page
  void navigateToRegister() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)
      {
        return RegisterPage(onTap: () {});
      }));
  }

  // sign user function
  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      ).then((value) => Navigator.pop(context));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      showErrorMessage(e.code);
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),

                  // logo
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),

                  const SizedBox(height: 25),

                  // welcome back, you've been missed
                  Text(
                    'Welcome_back_you_been_missed'.tr,
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // username textfield
                  DHTextField(
                    controller: emailController,
                    hintText:  'Email'.tr,
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // password textfield
                  DHTextField(
                    controller: passwordController,
                    hintText:  'Password'.tr,
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot_Password'.tr,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // sign in btn
                  DHButton(onTap: signUserIn, text: 'Sign_in'.tr),

                  const SizedBox(height: 25),

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
                            'Or_continue_with'.tr,
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
                        'not_a_member'.tr,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap!,
                        child: Text('Register_now'.tr,
                            style: const TextStyle(
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
