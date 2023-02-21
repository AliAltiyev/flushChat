import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class UserInput extends StatefulWidget {
  final IconData icon;
  final String labelText;
  final TextEditingController textEditingController;

  const UserInput(
      {Key? key,
      required this.icon,
      required this.labelText,
      required this.textEditingController})
      : super(key: key);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: widget.textEditingController,
        decoration: InputDecoration(
            focusedBorder: kRegistrationTextFieldBorder,
            enabledBorder: kRegistrationTextFieldBorder,
            icon: Icon(
              widget.icon,
              color: Colors.orangeAccent,
            ),
            labelStyle: const TextStyle(color: Colors.orange),
            labelText: widget.labelText,
            border: kRegistrationTextFieldBorder),
      ),
    );
  }
}
