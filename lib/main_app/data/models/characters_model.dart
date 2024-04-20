import 'package:json_annotation/json_annotation.dart';
import 'package:task2/main_app/data/models/wand_model.dart';

part 'characters_model.g.dart';
@JsonSerializable()
class CharacterModel {

  final String? id;
  final String? name;
  final List<String?> alternate_names;
  final String? species;
  final String? gender;
  final String? house;
  final DateTime? dateOfBirth;
  final int? yearOfBirth;
  final bool? wizard;
  final String? ancestry;
  final String? eyeColour;
  final String? hairColour;
  final WandModel? wand;

  final String? patronus;
  final bool? hogwartsStudent;
  final bool? hogwartsStaff;
  final String? actor;
  final List<String?> alternate_actors;
  final  String? alive;
  final String? image;

  CharacterModel(this.id, this.name, this.alternate_names, this.species, this.gender, this.house, this.dateOfBirth, this.yearOfBirth, this.wizard, this.ancestry, this.eyeColour, this.hairColour, this.wand, this.patronus, this.hogwartsStudent, this.hogwartsStaff, this.actor, this.alternate_actors, this.alive, this.image,);

  factory CharacterModel.fromJson(Map<String, dynamic> json) => _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}

