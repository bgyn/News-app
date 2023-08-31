import 'package:flutter/material.dart';

class AppTheme {
  //lightMode
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(color: Colors.black),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ));

  //darkMode
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 34, 34, 34),
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 24, 24, 24),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        color: Colors.white,
      ),
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.white,
      textColor: Colors.white,
    ),
  );
}
