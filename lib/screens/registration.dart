import 'package:firebase_auth/firebase_auth.dart';
import 'package:flush_chat/utils/constants.dart';
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
  late FirebaseAuth _auth;
  late User? _user;

  _registerUser() async {
    try {
      if (_auth.currentUser != null) {
      } else {}
      if (_auth.currentUser != null) {
        if (_auth.currentUser != null) {
          Navigator.of(context).pushNamed(kChat_screen_route);
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Password is so weak')));
      } else if (e.code == 'The email address is badly formatted') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Password is so weak')));
      } else if (e.code == 'operation-not-allowed') {
        throw Exception('There is a problem with auth service config :/');
      } else if (e.code == 'weak-password') {
        throw Exception('Please type stronger password');
      } else {
        print('auth error ' + e.toString());
        rethrow;
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth = FirebaseAuth.instance;
  }

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
                    onTap: () {
                      _registerUser();
                    },
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
