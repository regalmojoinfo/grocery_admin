import 'package:flutter/material.dart';
import 'package:grocery_admin/screens/home_screen.dart';
import 'package:grocery_admin/screens/sign_in_sign_up_screens/sign_in_screen.dart';
import 'package:grocery_admin/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery Store Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColorDark: Color(0xFF7936ff),
        primaryColor: Color(0xFF8b50ff),
        accentColor: Colors.pink,
        backgroundColor: Colors.white,
        canvasColor: Colors.white,
      ),
      //home: HomeScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        //'/initial_setup': (context) => InitialSetupScreen(),
        '/splash_screen': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/sign_in': (context) => SignInScreen(),
      },
    );
  }
}
