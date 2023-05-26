import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData themeData = ThemeData(
  primaryColor: const Color(0xFF006ad7),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black)),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          textStyle: TextStyle(color: kPrimaryColor),
          foregroundColor: kPrimaryColor,
          side: BorderSide(color: kPrimaryColor, width: 2))),
  inputDecorationTheme: InputDecorationTheme(
      border: _outlineInputBorder,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      contentPadding: const EdgeInsets.all(8),
      disabledBorder: _outlineInputBorder,
      focusedBorder: _outlineInputBorder,
      enabledBorder: _outlineInputBorder,
      errorBorder: _outlineInputBorder),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF006ad7),
        textStyle: const TextStyle(
          fontSize: 18,
        ),
        disabledBackgroundColor: Colors.grey),
  ),
);

OutlineInputBorder _outlineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(
  color: Colors.grey,
));
