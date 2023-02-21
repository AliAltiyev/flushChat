import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Hero(
            tag: 'logoTag',
            child: Container(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                'assets/mainimage.png',
              ),
            )),
      ],
    ));
  }
}
