import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              height: 100,
              color: Colors.black12,
              child: Text(
                'Flash Chat',
                textAlign: TextAlign.center,
                style: appLogoStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Image.asset(
                'assets/mainimage.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Column(
              children: [
                _registrationButton(),
                const SizedBox(
                  height: 20,
                ),
                _signInButton(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _signInButton() {
    return Container(
      decoration: kSignInButtonDecoration,
      height: 50,
      width: 200,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: const Text(
        'Sign In',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _registrationButton() {
    return Container(
      decoration: kRegistrationButtonDecoration,
      height: 50,
      width: 200,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: const Text(
        'Registration',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}
