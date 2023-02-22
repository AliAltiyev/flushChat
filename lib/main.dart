import 'package:firebase_core/firebase_core.dart';
import 'package:flush_chat/screens/chat_screen.dart';
import 'package:flush_chat/screens/home.dart';
import 'package:flush_chat/screens/registration.dart';
import 'package:flush_chat/screens/sign_in.dart';
import 'package:flush_chat/screens/welcome..dart';
import 'package:flush_chat/utils/constants.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        kChat_screen_route: (context) => const ChatScreen()
      },
    );
  }
}
