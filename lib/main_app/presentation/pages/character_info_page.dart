import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/characters_model.dart';
import '../providers/characters_provider.dart';
import '../widgets/custom_list_tile.dart';

@RoutePage()
class CharacterInfoPage extends StatelessWidget {

  final String characterId;
  const CharacterInfoPage({super.key, required this.characterId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext
      context) =>
          CharactersProvider(),
      builder: (context,
          child) =>
          BuildCharacterInfoPage(
              characterId,
              context:
              context),
    );
  }
}


class BuildCharacterInfoPage
    extends StatefulWidget {
  const BuildCharacterInfoPage(this.characterId,
      {super.key,
        required this.context});

  final BuildContext context;
  final String characterId;

  @override
  State<BuildCharacterInfoPage>
  createState() =>
      _BuildHomePageState();
}

class _BuildHomePageState
    extends State<
        BuildCharacterInfoPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback(
            (_) {
          context
              .read<
              CharactersProvider>()
              .getCharacterById(widget.characterId);
        });

  }

  @override
  Widget build(
      BuildContext context) {
    final providerWatch = context.watch<
        CharactersProvider>();

    final providerRead = context.read<
        CharactersProvider>();

    CharacterModel? characterDetails = providerWatch
        .currentCharacter;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text(
              characterDetails != null ? "${characterDetails!.name}" : "",
              style: TextStyle(
                  color: Colors
                      .white),
            ),
            backgroundColor: Theme
                .of(context)
                .appBarTheme
                .backgroundColor,
          ),
          characterDetails != null
              ? SliverToBoxAdapter(
            child: Column(
              // children: characterDetails.toJson().toList();
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