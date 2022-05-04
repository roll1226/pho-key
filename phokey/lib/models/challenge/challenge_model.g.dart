// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Challenge _$$_ChallengeFromJson(Map<String, dynamic> json) => _$_Challenge(
      id: json['id'] as String?,
      code: json['code'] as String,
      keyholeId: json['keyholeId'] as String,
      delFlag: json['delFlag'] as bool? ?? false,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$_ChallengeToJson(_$_Challenge instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'keyholeId': instance.keyholeId,
      'delFlag': instance.delFlag,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
