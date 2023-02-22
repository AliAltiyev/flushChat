import 'package:flutter/material.dart';

import '../utils/constants.dart';
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
        children:[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                tag: 'logoTag',
                child: Container(
                    width: double.infinity,
                    child: Image.asset('assets/mainimage.png')),
              ),
              Column(
                children: [
                  _registrationTextField(
                      icon: Icons.email_outlined,
                      labelText: 'Email',
                      textEditingController: _emailTextController),
                  const SizedBox(
                    height: 30,
                  ),
                  _registrationTextField(
                      icon: Icons.lock,
                      labelText: 'Password',
                      textEditingController: _passwordTextController),
                  RegistrationButton(
                    buttonColor: Colors.deepOrangeAccent,
                    labelText: 'Sign up',
                    onTap: () {
                    },
                  ),
                ],
              )
            ],
          )
        ] ,
      ),
    );
  }

  Padding _registrationTextField(
      {required IconData icon,
      required String labelText,
      required TextEditingController textEditingController}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            focusedBorder: kRegistrationTextFieldBorder,
            enabledBorder: kRegistrationTextFieldBorder,
            icon: Icon(
              icon,
              color: Colors.orangeAccent,
            ),
            labelStyle: const TextStyle(color: Colors.orange),
            labelText: labelText,
            border: kRegistrationTextFieldBorder),
      ),
    );
  }
}
