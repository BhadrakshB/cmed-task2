// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CharacterInfoRoute.name: (routeData) {
      final args = routeData.argsAs<CharacterInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CharacterInfoPage(
          key: args.key,
          characterId: args.characterId,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
  };
}

/// generated route for
/// [CharacterInfoPage]
class CharacterInfoRoute extends PageRouteInfo<CharacterInfoRouteArgs> {
  CharacterInfoRoute({
    Key? key,
    required String characterId,
    List<PageRouteInfo>? children,
  }) : super(
          CharacterInfoRoute.name,
          args: CharacterInfoRouteArgs(
            key: key,
            characterId: characterId,
          ),
          initialChildren: children,
        );

  static const String name = 'CharacterInfoRoute';

  static const PageInfo<CharacterInfoRouteArgs> page =
      PageInfo<CharacterInfoRouteArgs>(name);
}

class CharacterInfoRouteArgs {
  const CharacterInfoRouteArgs({
    this.key,
    required this.characterId,
  });

  final Key? key;

  final String characterId;

  @override
  String toString() {
    return 'CharacterInfoRouteArgs{key: $key, characterId: $characterId}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
