import 'package:flush_chat/utils/constants.dart';
import 'package:flutter/material.dart';

class RegistrationButton extends StatefulWidget {
  final VoidCallback onTap;

  const RegistrationButton({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegistrationButton> createState() => _RegistrationButtonState();
}

class _RegistrationButtonState extends State<RegistrationButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
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
      ),
    );
  }
}
