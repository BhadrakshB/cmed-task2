import 'package:flutter/material.dart';

import '../../data/models/characters_model.dart';

class CustomListTile extends StatelessWidget {

  final CharacterModel character;
  const CustomListTile({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return ListTile(

      style: ListTileStyle.drawer,
      isThreeLine: true,
      leading: CircleAvatar(foregroundImage: NetworkImage(character.image!),),
      title: Text("${character.name}"),
      subtitle: Text("Played by: ${character.actor}\nHouse name: ${character.house}"),


    );
  }
}
