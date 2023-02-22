import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flush_chat/widgets/buttons/registration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animationController.forward();
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn);

    animationController.addListener(() {
      setState(() {
        debugPrint('${animation.value}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: animation.value * 150,
                  child: SizedBox(
                    width: 250.0,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontFamily: 'Agne',
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText('Discipline is the best tool'),
                          TypewriterAnimatedText('Design first, then code'),
                          TypewriterAnimatedText(
                              'Do not patch bugs out, rewrite them'),
                          TypewriterAnimatedText(
                              'Do not test bugs out, design them out'),
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  )),
              Hero(
                tag: 'logoTag',
                child: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Image.asset(
                    'assets/mainimage.png',
                    width: animation.value * 400,
                    height: animation.value * 400,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    buttonColor: Colors.deepOrangeAccent,
                    childText: 'Registration',
                    onTap: () {
                      Navigator.pushNamed(context, kRegistration_screen_route);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    foreGroundColor: Colors.deepOrangeAccent,
                    onTap: () {
                      Navigator.pushNamed(context, kSignIn_screen_route);
                    },
                    childText: 'Sign in',
                    buttonColor: Colors.white,
                    borderSideColor: Colors.deepOrangeAccent,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
