import 'package:firebase_auth/firebase_auth.dart';
import 'package:flush_chat/utils/constants.dart';
import 'package:flush_chat/widgets/buttons/registration.dart';
import 'package:flush_chat/widgets/textfield/user_input.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          shrinkWrap: true,
      children: [
        const SizedBox(
          height: 40,
        ),
        Hero(
            tag: 'logoTag',
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                'assets/mainimage.png',
              ),
            )),
        const SizedBox(
          height: 30,
        ),
        CustomTextField(
            icon: Icons.email_outlined,
            labelText: 'Email',
            textEditingController: _emailTextController),
        CustomTextField(
            icon: Icons.lock_outline,
            labelText: 'Password',
            textEditingController: _passwordTextController),
        CustomButton(
          padding: 40,
          onTap: () async {
            try {
              final user = await _auth.signInWithEmailAndPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text);
              if (mounted) Navigator.pushNamed(context, kChat_screen_route);
            } catch (e) {
              print(e);
            }
          },
          childText: 'Sign in',
          buttonColor: Colors.orange,
        )
      ],
    ));
  }
}
