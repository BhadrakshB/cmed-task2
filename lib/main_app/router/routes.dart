

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../presentation/pages/character_info_page.dart';
import '../presentation/pages/home_page.dart';

part 'routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {

    List<AutoRoute> get routes => [
      AutoRoute(page: HomeRoute.page, initial: true),
      AutoRoute(page: CharacterInfoRoute.page),
    ];
}