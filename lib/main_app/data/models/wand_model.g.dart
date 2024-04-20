// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WandModel _$WandModelFromJson(Map<String, dynamic> json) => WandModel(
      json['wood'] as String?,
      json['core'] as String?,
      (json['length'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WandModelToJson(WandModel instance) => <String, dynamic>{
      'wood': instance.wood,
      'core': instance.core,
      'length': instance.length,
    };
