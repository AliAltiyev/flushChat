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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        const SizedBox(height: 40,),
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
          onTap: () {},
          childText: 'Sign in',
          buttonColor: Colors.orange,
          )
      ],
    ));
  }
}
