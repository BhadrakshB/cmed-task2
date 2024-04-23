import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/characters_model.dart';
import '../../data/models/wand_model.dart';
import '../providers/characters_provider.dart';
import '../widgets/custom_list_tile.dart';

@RoutePage()
class CharacterInfoPage
    extends StatelessWidget {

  final String characterId;

  const CharacterInfoPage(
      {super.key, required this.characterId});

  @override
  Widget build(
      BuildContext context) {
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
  const BuildCharacterInfoPage(
      this.characterId,
      {super.key,
        required this.context});

  final BuildContext context;
  final String characterId;

  @override
  State<
      BuildCharacterInfoPage>
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
              .getCharacterById(
              widget
                  .characterId);
        });
  }

  @override
  Widget build(
      BuildContext context) {
    final providerWatch = context
        .watch<
        CharactersProvider>();

    final providerRead = context
        .read<
        CharactersProvider>();

    Map<String,
        dynamic>? characterDetails = providerWatch
        .currentCharacter
        ?.toJson();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text(
              characterDetails !=
                  null
                  ? "Character Details"
                  : "",
              style: const TextStyle(
                  color: Colors
                      .white),
            ),
            backgroundColor: Theme
                .of(context)
                .appBarTheme
                .backgroundColor,
          ),
          characterDetails !=
              null
              ? SliverList(delegate: SliverChildBuilderDelegate(

              (context, index) {
                dynamic currentKey = characterDetails
                    .keys
                    .elementAt(
                    index);
                dynamic currentValue = characterDetails[currentKey];

                if (currentValue.runtimeType == WandModel) {
                  if ((currentValue as WandModel).isEmpty()) {
                    return SizedBox();
                  }
                }
                 
                return AttributeRow(name: currentKey, value: currentValue,);
              }, childCount: characterDetails
              .keys.length,
          ),)

          // SliverToBoxAdapter(
          //   child: ListView
          //       .builder(
          //       itemBuilder: (
          //           context,
          //           index) {
          //
          //       }),
          // )
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

class AttributeRow
    extends StatelessWidget {
  final String name;
  final value;

  const AttributeRow({Key? key, required this.name, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     
    //  
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name + ':', style: const TextStyle(fontWeight: FontWeight.bold),),
              const SizedBox(width: 10),
              Expanded(child: Text(  value.toString(), softWrap: true, overflow: TextOverflow.visible, textAlign: TextAlign.start,) )
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}