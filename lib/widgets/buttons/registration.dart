import 'package:flutter/material.dart';

class RegistrationButton extends StatelessWidget {
  final VoidCallback onTap;
  final String labelText;
  final Color buttonColor;
  final Color? borderSideColor;
  final Color? foreGroundColor;

  const RegistrationButton(
      {Key? key,
      required this.onTap,
      required this.labelText,
      required this.buttonColor,
      this.borderSideColor,
      this.foreGroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            side: BorderSide(
                color: borderSideColor ?? Colors.transparent, width: 2)),
        color: buttonColor,
        height: 50,
        minWidth: 200,
        padding: const EdgeInsets.symmetric(vertical: 10),
        onPressed: onTap,
        child: Text(
          labelText,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: foreGroundColor ?? Colors.white),
        ),
      ),
    );
  }
}
