//Screen Routes
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kWelcome_screen_route = '/';
const kRegistration_screen_route = '/registration_screen';
const kSignIn_screen_route = '/sign_in_screen';
const kHome_srceen_route = '/home_screen';

//ui
final kRegistrationButtonDecoration = BoxDecoration(
    color: Colors.deepOrangeAccent,
    border: Border.all(width: 2, color: Colors.orangeAccent),
    borderRadius: const BorderRadius.all(Radius.circular(20)));

final kSignInButtonDecoration = BoxDecoration(
    color: Colors.white,
    border: Border.all(width: 2, color: Colors.orangeAccent),
    borderRadius: const BorderRadius.all(Radius.circular(20)));

final kAppLogoStyle = GoogleFonts.arimaMadurai(
    textStyle: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        shadows: [Shadow(color: Colors.orange, blurRadius: 100)]));

final kRegistrationTextFieldEnabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(
      width: 2,
      color: Colors.orangeAccent,
    ));

final kRegistrationTextFieldFocusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(
      width: 2,
      color: Colors.deepOrangeAccent,
    ));
