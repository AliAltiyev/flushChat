import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String childText;
  final Color buttonColor;
  final Color? borderSideColor;
  final Color? foreGroundColor;
  final double? padding;

  const CustomButton(
      {Key? key,
      required this.onTap,
      required this.childText,
      required this.buttonColor,
      this.borderSideColor,
      this.foreGroundColor,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.all(padding ?? 0),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              side: BorderSide(
                  color: borderSideColor ?? Colors.transparent, width: 2)),
          color: buttonColor,
          height: 50,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          onPressed: onTap,
          child: Text(
            childText,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: foreGroundColor ?? Colors.white),
          ),
        ),
      ),
    );
  }
}
