
import 'package:flutter/material.dart';

import 'constants.dart';
import 'main_app/router/routes.dart';

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

  final AppRouter _appRouter = AppRouter();
    @override
  Widget build(
      BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'CMED Task 2',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,

    );
  }
}

