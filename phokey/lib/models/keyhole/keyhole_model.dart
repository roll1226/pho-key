import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:phokey/models/timestamp_converter.dart';

part 'keyhole_model.freezed.dart';
part 'keyhole_model.g.dart';

@freezed
abstract class Keyhole implements _$Keyhole {
  const Keyhole._();

  const factory Keyhole(
      {String? id,
      required String body,
      required String imagePath,
      @Default(false) bool delFlag,
      required String latitude,
      required String longitude,
      @TimestampConverter() required DateTime createdAt,
      @TimestampConverter() required DateTime updatedAt}) = _Keyhole;

  factory Keyhole.empty() => Keyhole(
      body: '',
      imagePath: '',
      latitude: '',
      longitude: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now());

  factory Keyhole.fromJson(Map<String, dynamic> json) =>
      _$KeyholeFromJson(json);

  // ドキュメントのスナップショットを変換するために利用
  factory Keyhole.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    // doc.idがitemIDのため、copyWithでIDをモデルにコピーする
    return Keyhole.fromJson(data).copyWith(id: doc.id);
  }

  // アイテムモデルをMap<String, dynamic>に変換するメソッド
  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
