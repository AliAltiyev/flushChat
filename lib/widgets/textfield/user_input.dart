import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String labelText;
  final TextEditingController textEditingController;

  const CustomTextField(
      {Key? key,
      required this.icon,
      required this.labelText,
      required this.textEditingController})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: widget.textEditingController,
        decoration: InputDecoration(
            focusedBorder: kRegistrationTextFieldFocusedBorder,
            enabledBorder: kRegistrationTextFieldEnabledBorder,
            icon: Icon(
              widget.icon,
              color: Colors.orangeAccent,
            ),
            labelStyle: const TextStyle(color: Colors.orange),
            labelText: widget.labelText,
            ),
      ),
    );
  }
}
