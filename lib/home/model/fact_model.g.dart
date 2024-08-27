// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FactModel _$FactModelFromJson(Map<String, dynamic> json) => FactModel(
      sId: json['__id'] as String?,
      user: json['user'] as String?,
      text: json['text'] as String?,
      iV: (json['__v'] as num?)?.toInt(),
      source: json['source'] as String?,
      updatedAt: json['updatedAt'] as String?,
      type: json['type'] as String?,
      createdAt: json['createdAt'] as String?,
      deleted: json['deleted'] as bool?,
      used: json['used'] as bool?,
    );

Map<String, dynamic> _$FactModelToJson(FactModel instance) => <String, dynamic>{
      '__id': instance.sId,
      '__v': instance.iV,
      'user': instance.user,
      'text': instance.text,
      'source': instance.source,
      'updatedAt': instance.updatedAt,
      'type': instance.type,
      'createdAt': instance.createdAt,
      'deleted': instance.deleted,
      'used': instance.used,
    };
