import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'api_create_keyhole_model.freezed.dart';
part 'api_create_keyhole_model.g.dart';

@freezed
abstract class ApiCreateKeyhole implements _$ApiCreateKeyhole {
  const factory ApiCreateKeyhole(
      {required int code, required String keyholeId}) = _ApiCreateKeyhole;

  factory ApiCreateKeyhole.fromJson(String str) =>
      ApiCreateKeyhole.fromMap(json.decode(str));

  factory ApiCreateKeyhole.fromMap(Map<String, dynamic> json) =>
      _$ApiCreateKeyholeFromJson(json);
}
