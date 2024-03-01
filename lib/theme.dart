import 'package:flutter/material.dart';

class ThemeClass {
  Color lightPrimaryColor = Colors.lightBlue;
  Color darkPrimaryColor = Colors.indigoAccent;

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: _themeClass.lightPrimaryColor,
        background: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: _themeClass.lightPrimaryColor,
        foregroundColor: Colors.white,
      ),
      snackBarTheme: const SnackBarThemeData(
        actionBackgroundColor: Colors.lightBlue,
        contentTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      iconTheme: IconThemeData(
        color: _themeClass.lightPrimaryColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.grey),
        activeIndicatorBorder: BorderSide(color: Colors.lightBlue),
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.black),
        titleMedium: TextStyle(color: Colors.black),
        titleSmall: TextStyle(color: Colors.black),
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
        bodySmall: TextStyle(color: Colors.black),
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
          foregroundColor: Colors.white),
      iconTheme: IconThemeData(
        color: _themeClass.darkPrimaryColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.grey),
        activeIndicatorBorder: BorderSide(color: Colors.indigoAccent),
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.indigoAccent),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
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
