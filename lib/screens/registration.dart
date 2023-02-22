import 'package:flush_chat/widgets/textfield/user_input.dart';
import 'package:flutter/material.dart';

import '../widgets/buttons/registration.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                tag: 'logoTag',
                child: SizedBox(
                    width: double.infinity,
                    child: Image.asset('assets/mainimage.png')),
              ),
              Column(
                children: [
                  CustomTextField(
                      icon: Icons.email_outlined,
                      labelText: 'Email',
                      textEditingController: _emailTextController),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                      icon: Icons.lock_outline_sharp,
                      labelText: 'Password',
                      textEditingController: _passwordTextController),
                  CustomButton(
                    buttonColor: Colors.deepOrangeAccent,
                    childText: 'Sign up',
                    onTap: () {},
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
