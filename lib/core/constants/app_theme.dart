<<<<<<< HEAD
import 'package:flutter/material.dart';

class AppTheme {

  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: Colors.blue,

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      elevation: 0,

    )
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: Colors.indigo,

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    )

  );
=======
import 'package:flutter/material.dart';

class AppTheme {

  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: Colors.blue,

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      elevation: 0,

    )
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: Colors.indigo,

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    )

  );
>>>>>>> 8f9e9b4ff38e1dba3a22217e58566c9b46c572be
}