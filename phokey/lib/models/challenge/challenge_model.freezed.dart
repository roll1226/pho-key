// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'challenge_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Challenge _$ChallengeFromJson(Map<String, dynamic> json) {
  return _Challenge.fromJson(json);
}

/// @nodoc
mixin _$Challenge {
  String? get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get keyholeId => throw _privateConstructorUsedError;
  bool get delFlag => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChallengeCopyWith<Challenge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeCopyWith<$Res> {
  factory $ChallengeCopyWith(Challenge value, $Res Function(Challenge) then) =
      _$ChallengeCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String code,
      String keyholeId,
      bool delFlag,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class _$ChallengeCopyWithImpl<$Res> implements $ChallengeCopyWith<$Res> {
  _$ChallengeCopyWithImpl(this._value, this._then);

  final Challenge _value;
  // ignore: unused_field
  final $Res Function(Challenge) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? keyholeId = freezed,
    Object? delFlag = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      keyholeId: keyholeId == freezed
          ? _value.keyholeId
          : keyholeId // ignore: cast_nullable_to_non_nullable
              as String,
      delFlag: delFlag == freezed
          ? _value.delFlag
          : delFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ChallengeCopyWith<$Res> implements $ChallengeCopyWith<$Res> {
  factory _$ChallengeCopyWith(
          _Challenge value, $Res Function(_Challenge) then) =
      __$ChallengeCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String code,
      String keyholeId,
      bool delFlag,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class __$ChallengeCopyWithImpl<$Res> extends _$ChallengeCopyWithImpl<$Res>
    implements _$ChallengeCopyWith<$Res> {
  __$ChallengeCopyWithImpl(_Challenge _value, $Res Function(_Challenge) _then)
      : super(_value, (v) => _then(v as _Challenge));

  @override
  _Challenge get _value => super._value as _Challenge;

  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? keyholeId = freezed,
    Object? delFlag = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_Challenge(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      keyholeId: keyholeId == freezed
          ? _value.keyholeId
          : keyholeId // ignore: cast_nullable_to_non_nullable
              as String,
      delFlag: delFlag == freezed
          ? _value.delFlag
          : delFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Challenge extends _Challenge with DiagnosticableTreeMixin {
  const _$_Challenge(
      {this.id,
      required this.code,
      required this.keyholeId,
      this.delFlag = false,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt})
      : super._();

  factory _$_Challenge.fromJson(Map<String, dynamic> json) =>
      _$$_ChallengeFromJson(json);

  @override
  final String? id;
  @override
  final String code;
  @override
  final String keyholeId;
  @override
  @JsonKey()
  final bool delFlag;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Challenge(id: $id, code: $code, keyholeId: $keyholeId, delFlag: $delFlag, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Challenge'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('keyholeId', keyholeId))
      ..add(DiagnosticsProperty('delFlag', delFlag))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Challenge &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.keyholeId, keyholeId) &&
            const DeepCollectionEquality().equals(other.delFlag, delFlag) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(keyholeId),
      const DeepCollectionEquality().hash(delFlag),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$ChallengeCopyWith<_Challenge> get copyWith =>
      __$ChallengeCopyWithImpl<_Challenge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChallengeToJson(this);
  }
}

abstract class _Challenge extends Challenge {
  const factory _Challenge(
      {final String? id,
      required final String code,
      required final String keyholeId,
      final bool delFlag,
      @TimestampConverter() required final DateTime createdAt,
      @TimestampConverter() required final DateTime updatedAt}) = _$_Challenge;
  const _Challenge._() : super._();

  factory _Challenge.fromJson(Map<String, dynamic> json) =
      _$_Challenge.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get code => throw _privateConstructorUsedError;
  @override
  String get keyholeId => throw _privateConstructorUsedError;
  @override
  bool get delFlag => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ChallengeCopyWith<_Challenge> get copyWith =>
      throw _privateConstructorUsedError;
}
