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
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 1));
    animationController.forward();
    animation = CurvedAnimation(
        parent: animationController, curve: Curves.bounceIn);

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
                height: animation.value * 200,
                color: Colors.black12,
                child: Text(
                  'Flash Chat',
                  textAlign: TextAlign.center,
                  style: kAppLogoStyle,
                ),
              ),
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
                  RegistrationButton(
                    onTap: () {
                      Navigator.pushNamed(context, kRegistration_screen_route);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _signInButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(kSignIn_screen_route);
      },
      child: Container(
        decoration: kSignInButtonDecoration,
        height: 50,
        width: 200,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: const Text(
          'Sign In',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
