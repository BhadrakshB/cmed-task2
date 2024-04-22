
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/characters_model.dart';
import '../providers/characters_provider.dart';
import '../widgets/custom_list_tile.dart';

class HomePage extends StatelessWidget {
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
              context: context),
    );
  }
}

class BuildHomePage extends StatefulWidget {
  const BuildHomePage({super.key, required this.context});

  final BuildContext context;

  @override
  State<BuildHomePage> createState() => _BuildHomePageState();
}

class _BuildHomePageState extends State<BuildHomePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CharactersProvider>().getCharacters();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CharactersProvider>();


    bool isEmpty = provider.characters.isNotEmpty;


    return Scaffold(

        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: true,
              title: const Text("The Potterverse", style: TextStyle(),),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            provider.characters.isNotEmpty ? SliverList(delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  CharacterModel character = provider.characters.elementAt(index);
                  return Tooltip(message: "click to view full information",child: CustomListTile(character: character,));

                }
            ),
              
            ): const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator(),)),
          ],
        ),
    ) ;
  }
}

