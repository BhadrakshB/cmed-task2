import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/characters_model.dart';
import '../../router/routes.dart';
import '../providers/characters_provider.dart';
import '../widgets/custom_list_tile.dart';

@RoutePage()
class HomePage
    extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(
      BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext
              context) =>
          CharactersProvider(),
      builder: (context,
              child) =>
          BuildHomePage(
              context:
                  context),
    );
  }
}

class BuildHomePage
    extends StatefulWidget {
  const BuildHomePage(
      {super.key,
      required this.context});

  final BuildContext context;

  @override
  State<BuildHomePage>
      createState() =>
          _BuildHomePageState();
}

class _BuildHomePageState
    extends State<
        BuildHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback(
            (_) {
      context
          .read<
              CharactersProvider>()
          .getCharacters();


    });
  }

  @override
  Widget build(
      BuildContext context) {
    final providerRead =
        context.read<
            CharactersProvider>();

    final providerWatch =
        context.watch<
            CharactersProvider>();

    bool isEmpty =
        providerWatch
            .characters
            .isNotEmpty;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: const Text(
              "The Potterverse",
              style: TextStyle(
                  color: Colors
                      .white),
            ),
            backgroundColor: Theme
                    .of(context)
                .appBarTheme
                .backgroundColor,
          ),
          isEmpty
              ? SliverList(
                  delegate:
                      SliverChildBuilderDelegate((_,
                          int index) {
                    CharacterModel
                        character =
                        providerRead
                            .characters
                            .elementAt(index);
                    return Tooltip(
                      message:
                          "click to view full information",
                      child: CustomListTile(
                          character: character,
                          onTap: () {
                            context.pushRoute(CharacterInfoRoute(characterId: character.id ?? ''));
                          }),
                    );
                  }),
                )
              : providerRead
                          .state ==
                      FetchState
                          .error
                  ? const SliverToBoxAdapter(
                      child:
                          Center(
                        child:
                            Text(
                          "Some error occoured, please restart the app",
                        ),
                      ),
                    )
                  : const SliverToBoxAdapter(
                      child:
                          Center(
                      child:
                          CircularProgressIndicator(),
                    )),
        ],
      ),
    );
  }
}
