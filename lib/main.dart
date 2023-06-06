import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:work_out_gym/firebase_options.dart';
import 'package:work_out_gym/pages/auth.dart';
import 'package:work_out_gym/theme_provider.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');


  runApp(
      ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(),
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeData defaultTheme = ThemeData();

  final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xFF1c1c1e),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF242328),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF242328),
      unselectedItemColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
      ),
    ),
  );

  final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: const Color(0xFFE3F4F4),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFC4DFDF),
      titleTextStyle: TextStyle(
        color: Colors.black,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    tabBarTheme: TabBarTheme(
        labelColor: Colors.black87,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
              color: Colors.orange.shade300,
              width: 3.0
          ),
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color(0xFFC4DFDF),
      unselectedItemColor: Colors.black87,
      selectedItemColor: Colors.orange.shade300,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
      ),
    ),
  );

  ThemeData themePicker(ThemeName themeName) {
    if (themeName == ThemeName.dark) {
      return darkTheme;
    } else if (themeName == ThemeName.light) {
      return lightTheme;
    } else {
      return defaultTheme;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themePicker(
          Provider.of<ThemeProvider>(context).themeName,
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
    );
  }
}
