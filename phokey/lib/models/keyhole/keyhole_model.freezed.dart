// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'keyhole_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Keyhole _$KeyholeFromJson(Map<String, dynamic> json) {
  return _Keyhole.fromJson(json);
}

/// @nodoc
mixin _$Keyhole {
  String? get id => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  bool get delFlag => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeyholeCopyWith<Keyhole> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyholeCopyWith<$Res> {
  factory $KeyholeCopyWith(Keyhole value, $Res Function(Keyhole) then) =
      _$KeyholeCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String body,
      String imagePath,
      bool delFlag,
      String latitude,
      String longitude,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class _$KeyholeCopyWithImpl<$Res> implements $KeyholeCopyWith<$Res> {
  _$KeyholeCopyWithImpl(this._value, this._then);

  final Keyhole _value;
  // ignore: unused_field
  final $Res Function(Keyhole) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? body = freezed,
    Object? imagePath = freezed,
    Object? delFlag = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      delFlag: delFlag == freezed
          ? _value.delFlag
          : delFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$KeyholeCopyWith<$Res> implements $KeyholeCopyWith<$Res> {
  factory _$KeyholeCopyWith(_Keyhole value, $Res Function(_Keyhole) then) =
      __$KeyholeCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String body,
      String imagePath,
      bool delFlag,
      String latitude,
      String longitude,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class __$KeyholeCopyWithImpl<$Res> extends _$KeyholeCopyWithImpl<$Res>
    implements _$KeyholeCopyWith<$Res> {
  __$KeyholeCopyWithImpl(_Keyhole _value, $Res Function(_Keyhole) _then)
      : super(_value, (v) => _then(v as _Keyhole));

  @override
  _Keyhole get _value => super._value as _Keyhole;

  @override
  $Res call({
    Object? id = freezed,
    Object? body = freezed,
    Object? imagePath = freezed,
    Object? delFlag = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_Keyhole(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      delFlag: delFlag == freezed
          ? _value.delFlag
          : delFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_Keyhole extends _Keyhole with DiagnosticableTreeMixin {
  const _$_Keyhole(
      {this.id,
      required this.body,
      required this.imagePath,
      this.delFlag = false,
      required this.latitude,
      required this.longitude,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt})
      : super._();

  factory _$_Keyhole.fromJson(Map<String, dynamic> json) =>
      _$$_KeyholeFromJson(json);

  @override
  final String? id;
  @override
  final String body;
  @override
  final String imagePath;
  @override
  @JsonKey()
  final bool delFlag;
  @override
  final String latitude;
  @override
  final String longitude;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Keyhole(id: $id, body: $body, imagePath: $imagePath, delFlag: $delFlag, latitude: $latitude, longitude: $longitude, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Keyhole'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('imagePath', imagePath))
      ..add(DiagnosticsProperty('delFlag', delFlag))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Keyhole &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.imagePath, imagePath) &&
            const DeepCollectionEquality().equals(other.delFlag, delFlag) &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(imagePath),
      const DeepCollectionEquality().hash(delFlag),
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$KeyholeCopyWith<_Keyhole> get copyWith =>
      __$KeyholeCopyWithImpl<_Keyhole>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KeyholeToJson(this);
  }
}

abstract class _Keyhole extends Keyhole {
  const factory _Keyhole(
      {final String? id,
      required final String body,
      required final String imagePath,
      final bool delFlag,
      required final String latitude,
      required final String longitude,
      @TimestampConverter() required final DateTime createdAt,
      @TimestampConverter() required final DateTime updatedAt}) = _$_Keyhole;
  const _Keyhole._() : super._();

  factory _Keyhole.fromJson(Map<String, dynamic> json) = _$_Keyhole.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get body => throw _privateConstructorUsedError;
  @override
  String get imagePath => throw _privateConstructorUsedError;
  @override
  bool get delFlag => throw _privateConstructorUsedError;
  @override
  String get latitude => throw _privateConstructorUsedError;
  @override
  String get longitude => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$KeyholeCopyWith<_Keyhole> get copyWith =>
      throw _privateConstructorUsedError;
}
