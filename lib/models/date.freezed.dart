// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Date _$DateFromJson(Map<String, dynamic> json) {
  return _Date.fromJson(json);
}

/// @nodoc
mixin _$Date {
  int? get id => throw _privateConstructorUsedError;
  String? get datatime => throw _privateConstructorUsedError;
  String? get tipo => throw _privateConstructorUsedError;
  int? get object_id => throw _privateConstructorUsedError;
  int? get content_type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DateCopyWith<Date> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateCopyWith<$Res> {
  factory $DateCopyWith(Date value, $Res Function(Date) then) =
      _$DateCopyWithImpl<$Res, Date>;
  @useResult
  $Res call(
      {int? id,
      String? datatime,
      String? tipo,
      int? object_id,
      int? content_type});
}

/// @nodoc
class _$DateCopyWithImpl<$Res, $Val extends Date>
    implements $DateCopyWith<$Res> {
  _$DateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? datatime = freezed,
    Object? tipo = freezed,
    Object? object_id = freezed,
    Object? content_type = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      datatime: freezed == datatime
          ? _value.datatime
          : datatime // ignore: cast_nullable_to_non_nullable
              as String?,
      tipo: freezed == tipo
          ? _value.tipo
          : tipo // ignore: cast_nullable_to_non_nullable
              as String?,
      object_id: freezed == object_id
          ? _value.object_id
          : object_id // ignore: cast_nullable_to_non_nullable
              as int?,
      content_type: freezed == content_type
          ? _value.content_type
          : content_type // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DateImplCopyWith<$Res> implements $DateCopyWith<$Res> {
  factory _$$DateImplCopyWith(
          _$DateImpl value, $Res Function(_$DateImpl) then) =
      __$$DateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? datatime,
      String? tipo,
      int? object_id,
      int? content_type});
}

/// @nodoc
class __$$DateImplCopyWithImpl<$Res>
    extends _$DateCopyWithImpl<$Res, _$DateImpl>
    implements _$$DateImplCopyWith<$Res> {
  __$$DateImplCopyWithImpl(_$DateImpl _value, $Res Function(_$DateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? datatime = freezed,
    Object? tipo = freezed,
    Object? object_id = freezed,
    Object? content_type = freezed,
  }) {
    return _then(_$DateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      datatime: freezed == datatime
          ? _value.datatime
          : datatime // ignore: cast_nullable_to_non_nullable
              as String?,
      tipo: freezed == tipo
          ? _value.tipo
          : tipo // ignore: cast_nullable_to_non_nullable
              as String?,
      object_id: freezed == object_id
          ? _value.object_id
          : object_id // ignore: cast_nullable_to_non_nullable
              as int?,
      content_type: freezed == content_type
          ? _value.content_type
          : content_type // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DateImpl extends _Date {
  _$DateImpl(
      {required this.id,
      required this.datatime,
      required this.tipo,
      required this.object_id,
      required this.content_type})
      : super._();

  factory _$DateImpl.fromJson(Map<String, dynamic> json) =>
      _$$DateImplFromJson(json);

  @override
  final int? id;
  @override
  final String? datatime;
  @override
  final String? tipo;
  @override
  final int? object_id;
  @override
  final int? content_type;

  @override
  String toString() {
    return 'Date(id: $id, datatime: $datatime, tipo: $tipo, object_id: $object_id, content_type: $content_type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.datatime, datatime) ||
                other.datatime == datatime) &&
            (identical(other.tipo, tipo) || other.tipo == tipo) &&
            (identical(other.object_id, object_id) ||
                other.object_id == object_id) &&
            (identical(other.content_type, content_type) ||
                other.content_type == content_type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, datatime, tipo, object_id, content_type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DateImplCopyWith<_$DateImpl> get copyWith =>
      __$$DateImplCopyWithImpl<_$DateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DateImplToJson(
      this,
    );
  }
}

abstract class _Date extends Date {
  factory _Date(
      {required final int? id,
      required final String? datatime,
      required final String? tipo,
      required final int? object_id,
      required final int? content_type}) = _$DateImpl;
  _Date._() : super._();

  factory _Date.fromJson(Map<String, dynamic> json) = _$DateImpl.fromJson;

  @override
  int? get id;
  @override
  String? get datatime;
  @override
  String? get tipo;
  @override
  int? get object_id;
  @override
  int? get content_type;
  @override
  @JsonKey(ignore: true)
  _$$DateImplCopyWith<_$DateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
