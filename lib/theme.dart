import 'package:flutter/material.dart';

final ThemeData darkBlueLightBlueAccentTheme = ThemeData(
  hintColor: Colors.white,
  indicatorColor: Colors.white,
  primaryColor: Colors.blue[800],
  primaryColorLight: Colors.blue[300],
  primaryColorDark: Colors.blue[900],
  scaffoldBackgroundColor: const Color(0xFF121212),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    titleLarge: TextStyle(fontSize: 18.0, color: Colors.white),
    labelLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue[900],
    foregroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  dialogTheme: const DialogTheme(
    elevation: 2,
    backgroundColor: Color.fromARGB(255, 207, 43, 98),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blue[800],
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.lightBlueAccent[400],
      foregroundColor: Colors.white,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.lightBlueAccent[400],
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: BorderSide(color: Colors.lightBlueAccent.shade400),
      foregroundColor: Colors.lightBlueAccent[400],
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.blue[50],
    focusColor: Colors.lightBlueAccent[400],
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue.shade700,
      ),
    ),
    counterStyle: const TextStyle(color: Colors.white),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.lightBlueAccent.shade400,
      ),
    ),
  ),
);
