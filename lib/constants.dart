import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorSchemeSeed: Colors.indigo,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.indigoAccent.shade100,
  ),
  iconTheme: IconThemeData(
    color: Colors.white10,
  )

);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorSchemeSeed: Colors.white10,

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.indigo,
  ),
);

