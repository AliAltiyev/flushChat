import 'package:flush_chat/screens/home.dart';
import 'package:flush_chat/screens/registration.dart';
import 'package:flush_chat/screens/sign_in.dart';
import 'package:flush_chat/screens/welcome..dart';
import 'package:flush_chat/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flush Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(primaryColor: Colors.black),
      initialRoute: kWelcome_screen_route,
      routes: {
        kHome_srceen_route: (context) => const Home(),
        kRegistration_screen_route: (context) => const Registration(),
        kSignIn_screen_route: (context) => const SignIn(),
        kWelcome_screen_route: (context) => const WelcomeScreen(),
      },
    );
  }
}
