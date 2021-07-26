import 'package:flutter/material.dart';

ThemeData lightThemeData = ThemeData(
  primaryColor: Colors.blueGrey[600],
  accentColor: Colors.blueGrey[100],
  scaffoldBackgroundColor: Colors.blueGrey[100],
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: TextStyle(
        color: Colors.white,
      ),
      primary: Colors.red,
    ),
  ),
);

ThemeData darkThemeData = ThemeData(
  primaryColor: Colors.blue,
  accentColor: Colors.black12,
  scaffoldBackgroundColor: Colors.black12,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: TextStyle(
        color: Colors.white,
      ),
      primary: Colors.blue,
    ),
  ),
);
