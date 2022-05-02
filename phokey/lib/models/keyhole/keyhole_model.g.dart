// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyhole_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Keyhole _$$_KeyholeFromJson(Map<String, dynamic> json) => _$_Keyhole(
      id: json['id'] as String?,
      body: json['body'] as String,
      imagePath: json['imagePath'] as String,
      delFlag: json['delFlag'] as bool? ?? false,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$_KeyholeToJson(_$_Keyhole instance) =>
    <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'imagePath': instance.imagePath,
      'delFlag': instance.delFlag,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
