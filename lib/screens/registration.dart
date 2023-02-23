import 'package:firebase_auth/firebase_auth.dart';
import 'package:flush_chat/utils/constants.dart';
import 'package:flush_chat/widgets/textfield/user_input.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

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
  bool progressBarVisibility = false;

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
              Container(
                height: 100,
                width: 100,
                child: Visibility(
                    visible: progressBarVisibility,
                    child: LiquidLinearProgressIndicator(
                      value: 0.25,
                      // Defaults to 0.5.
                      valueColor: const AlwaysStoppedAnimation(Colors.pink),
                      // Defaults to the current Theme's accentColor.
                      backgroundColor: Colors.white,
                      // Defaults to the current Theme's backgroundColor.
                      borderColor: Colors.red,
                      borderWidth: 5.0,
                      borderRadius: 12.0,
                      direction: Axis.vertical,
                      // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                      center: Text("Loading..."),
                    )),
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
                      setState(() {
                        progressBarVisibility = true;
                      });
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
