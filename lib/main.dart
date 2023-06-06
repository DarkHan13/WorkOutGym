import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:work_out_gym/firebase_options.dart';
import 'package:work_out_gym/pages/auth.dart';
import 'package:work_out_gym/pages/login.dart';
import 'homepage.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1c1c1e),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF242328),
          // backgroundColor: Colors.deepOrange,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF242328),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
          ),
          titleMedium: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
    );
  }
}
