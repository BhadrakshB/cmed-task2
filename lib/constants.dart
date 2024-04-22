import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorSchemeSeed: Colors.indigo,
  appBarTheme: AppBarTheme(
    color: Colors.indigoAccent,

  ),

  textTheme: TextTheme(

  )
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorSchemeSeed: Colors.white10,
  appBarTheme: AppBarTheme(
    color: Colors.indigo,
  ),
);

