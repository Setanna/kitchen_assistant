import 'package:flutter/material.dart';

class ThemeClass {
  Color lightPrimaryColor = Colors.lightBlue;
  Color darkPrimaryColor = Colors.indigo;

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: _themeClass.lightPrimaryColor,
        background: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: _themeClass.lightPrimaryColor,
        foregroundColor: Colors.white
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 55),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => _themeClass.lightPrimaryColor),
        foregroundColor:
            MaterialStateProperty.resolveWith<Color>((states) => Colors.white),
      )));

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: _themeClass.darkPrimaryColor,
        background: Colors.indigo.shade800,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: _themeClass.darkPrimaryColor,
          foregroundColor: Colors.white
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 55),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => _themeClass.darkPrimaryColor),
        foregroundColor:
            MaterialStateProperty.resolveWith<Color>((states) => Colors.white),
      )));
}

ThemeClass _themeClass = ThemeClass();
