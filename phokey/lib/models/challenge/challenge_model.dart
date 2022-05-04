import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:phokey/models/timestamp_converter.dart';

part 'challenge_model.freezed.dart';
part 'challenge_model.g.dart';

@freezed
abstract class Challenge implements _$Challenge {
  const Challenge._();

  const factory Challenge(
      {String? id,
      required String code,
      required String keyholeId,
      @Default(false) bool delFlag,
      @TimestampConverter() required DateTime createdAt,
      @TimestampConverter() required DateTime updatedAt}) = _Challenge;

  factory Challenge.empty() => Challenge(
      code: '',
      keyholeId: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now());

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);

  // ドキュメントのスナップショットを変換するために利用
  factory Challenge.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    // doc.idがitemIDのため、copyWithでIDをモデルにコピーする
    return Challenge.fromJson(data).copyWith(id: doc.id);
  }

  // アイテムモデルをMap<String, dynamic>に変換するメソッド
  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
