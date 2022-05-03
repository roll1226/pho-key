// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api_create_keyhole_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiCreateKeyhole _$ApiCreateKeyholeFromJson(Map<String, dynamic> json) {
  return _ApiCreateKeyhole.fromJson(json);
}

/// @nodoc
mixin _$ApiCreateKeyhole {
  int get code => throw _privateConstructorUsedError;
  String get keyholeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiCreateKeyholeCopyWith<ApiCreateKeyhole> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiCreateKeyholeCopyWith<$Res> {
  factory $ApiCreateKeyholeCopyWith(
          ApiCreateKeyhole value, $Res Function(ApiCreateKeyhole) then) =
      _$ApiCreateKeyholeCopyWithImpl<$Res>;
  $Res call({int code, String keyholeId});
}

/// @nodoc
class _$ApiCreateKeyholeCopyWithImpl<$Res>
    implements $ApiCreateKeyholeCopyWith<$Res> {
  _$ApiCreateKeyholeCopyWithImpl(this._value, this._then);

  final ApiCreateKeyhole _value;
  // ignore: unused_field
  final $Res Function(ApiCreateKeyhole) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? keyholeId = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      keyholeId: keyholeId == freezed
          ? _value.keyholeId
          : keyholeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ApiCreateKeyholeCopyWith<$Res>
    implements $ApiCreateKeyholeCopyWith<$Res> {
  factory _$ApiCreateKeyholeCopyWith(
          _ApiCreateKeyhole value, $Res Function(_ApiCreateKeyhole) then) =
      __$ApiCreateKeyholeCopyWithImpl<$Res>;
  @override
  $Res call({int code, String keyholeId});
}

/// @nodoc
class __$ApiCreateKeyholeCopyWithImpl<$Res>
    extends _$ApiCreateKeyholeCopyWithImpl<$Res>
    implements _$ApiCreateKeyholeCopyWith<$Res> {
  __$ApiCreateKeyholeCopyWithImpl(
      _ApiCreateKeyhole _value, $Res Function(_ApiCreateKeyhole) _then)
      : super(_value, (v) => _then(v as _ApiCreateKeyhole));

  @override
  _ApiCreateKeyhole get _value => super._value as _ApiCreateKeyhole;

  @override
  $Res call({
    Object? code = freezed,
    Object? keyholeId = freezed,
  }) {
    return _then(_ApiCreateKeyhole(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      keyholeId: keyholeId == freezed
          ? _value.keyholeId
          : keyholeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiCreateKeyhole
    with DiagnosticableTreeMixin
    implements _ApiCreateKeyhole {
  const _$_ApiCreateKeyhole({required this.code, required this.keyholeId});

  factory _$_ApiCreateKeyhole.fromJson(Map<String, dynamic> json) =>
      _$$_ApiCreateKeyholeFromJson(json);

  @override
  final int code;
  @override
  final String keyholeId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApiCreateKeyhole(code: $code, keyholeId: $keyholeId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ApiCreateKeyhole'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('keyholeId', keyholeId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApiCreateKeyhole &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.keyholeId, keyholeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(keyholeId));

  @JsonKey(ignore: true)
  @override
  _$ApiCreateKeyholeCopyWith<_ApiCreateKeyhole> get copyWith =>
      __$ApiCreateKeyholeCopyWithImpl<_ApiCreateKeyhole>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiCreateKeyholeToJson(this);
  }
}

abstract class _ApiCreateKeyhole implements ApiCreateKeyhole {
  const factory _ApiCreateKeyhole(
      {required final int code,
      required final String keyholeId}) = _$_ApiCreateKeyhole;

  factory _ApiCreateKeyhole.fromJson(Map<String, dynamic> json) =
      _$_ApiCreateKeyhole.fromJson;

  @override
  int get code => throw _privateConstructorUsedError;
  @override
  String get keyholeId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ApiCreateKeyholeCopyWith<_ApiCreateKeyhole> get copyWith =>
      throw _privateConstructorUsedError;
}
