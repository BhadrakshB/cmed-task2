import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'constants.dart';
import 'main_app/presentation/pages/home_page.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp
    extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{


  @override
  void initState() {

    super.initState();

  }

  @override
  Widget build(
      BuildContext context) {
    return MaterialApp(
      title: 'CMED Task 2',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}

