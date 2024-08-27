import 'package:json_annotation/json_annotation.dart';

part 'fact_model.g.dart';

@JsonSerializable()
class FactModel {
  @JsonKey(name: '__id')
  String? sId;

  @JsonKey(name: '__v')
  int? iV;

  String? user;
  String? text;
  String? source;
  String? updatedAt;
  String? type;
  String? createdAt;
  bool? deleted;
  bool? used;

  FactModel({
    this.sId,
    this.user,
    this.text,
    this.iV,
    this.source,
    this.updatedAt,
    this.type,
    this.createdAt,
    this.deleted,
    this.used,
  });

  factory FactModel.fromJson(Map<String, dynamic> json) =>
      _$FactModelFromJson(json);

  Map<String, dynamic> toJson() => _$FactModelToJson(this);
}
