import 'package:flutter/material.dart';

const double kSpace = 10;
const kPrimaryColor = Color(0xFF020510);
const kRegularColor = Color(0xFF000000);
const kPrimaryLightColor = Colors.white;
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF3366FF), Color(0xFF00CCFF)],
);
const kSecondaryColor = Color(0xF6DAD4D4);
const lSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

Color black = Colors.black87;
// Color yellow = const Color(0xFFFFD832);
Color yellow = const Color(0xFFFFD700);
Color blue = Colors.blue;
Color white = Colors.white;

var kTextFieldDecoration = InputDecoration(
  border: const OutlineInputBorder(),
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: yellow, width: 1.0),
  ),
  hintText: 'Enter your Message',
  labelStyle: const TextStyle(color: Colors.grey),
  hintStyle: const TextStyle(color: Colors.grey),
);
const currentUserRadius = BorderRadius.only(
  topLeft: Radius.circular(30),
  bottomLeft: Radius.circular(30),
  bottomRight: Radius.circular(30),
);
const otherUsersRadius = BorderRadius.only(
  topRight: Radius.circular(30),
  bottomLeft: Radius.circular(30),
  bottomRight: Radius.circular(30),
);
