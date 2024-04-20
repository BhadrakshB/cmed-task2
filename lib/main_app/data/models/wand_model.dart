import 'package:json_annotation/json_annotation.dart';

part 'wand_model.g.dart';
@JsonSerializable()
class WandModel {
  final String? wood;
  final String? core;
  final double? length;

  WandModel(this.wood, this.core, this.length);


  factory WandModel.fromJson(Map<String, dynamic> json) => _$WandModelFromJson(json);

  Map<String, dynamic> toJson() => _$WandModelToJson(this);

}