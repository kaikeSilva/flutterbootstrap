// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DateImpl _$$DateImplFromJson(Map<String, dynamic> json) => _$DateImpl(
      id: json['id'] as int?,
      datatime: json['datatime'] as String?,
      tipo: json['tipo'] as String?,
      object_id: json['object_id'] as int?,
      content_type: json['content_type'] as int?,
    );

Map<String, dynamic> _$$DateImplToJson(_$DateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'datatime': instance.datatime,
      'tipo': instance.tipo,
      'object_id': instance.object_id,
      'content_type': instance.content_type,
    };
