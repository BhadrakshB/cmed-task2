// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      json['id'] as String?,
      json['name'] as String?,
      (json['alternate_names'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
      json['species'] as String?,
      json['gender'] as String?,
      json['house'] as String?,
      json['dateOfBirth'] as String?,
      json['yearOfBirth'] as int?,
      json['wizard'] as bool?,
      json['ancestry'] as String?,
      json['eyeColour'] as String?,
      json['hairColour'] as String?,
      json['wand'] == null
          ? null
          : WandModel.fromJson(json['wand'] as Map<String, dynamic>),
      json['patronus'] as String?,
      json['hogwartsStudent'] as bool?,
      json['hogwartsStaff'] as bool?,
      json['actor'] as String?,
      (json['alternate_actors'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
      json['alive'] as bool?,
      json['image'] as String?,
    );

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alternate_names': instance.alternateNames,
      'species': instance.species,
      'gender': instance.gender,
      'house': instance.house,
      'dateOfBirth': instance.dateOfBirth,
      'yearOfBirth': instance.yearOfBirth,
      'wizard': instance.wizard,
      'ancestry': instance.ancestry,
      'eyeColour': instance.eyeColour,
      'hairColour': instance.hairColour,
      'wand': instance.wand,
      'patronus': instance.patronus,
      'hogwartsStudent': instance.hogwartsStudent,
      'hogwartsStaff': instance.hogwartsStaff,
      'actor': instance.actor,
      'alternate_actors': instance.alternateActors,
      'alive': instance.alive,
      'image': instance.image,
    };
