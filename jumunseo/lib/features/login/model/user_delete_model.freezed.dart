// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_delete_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDeleteModel _$UserDeleteModelFromJson(Map<String, dynamic> json) {
  return _UserDeleteModel.fromJson(json);
}

/// @nodoc
mixin _$UserDeleteModel {
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Bool? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDeleteModelCopyWith<UserDeleteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDeleteModelCopyWith<$Res> {
  factory $UserDeleteModelCopyWith(
          UserDeleteModel value, $Res Function(UserDeleteModel) then) =
      _$UserDeleteModelCopyWithImpl<$Res, UserDeleteModel>;
  @useResult
  $Res call({String code, String message, Bool? data});
}

/// @nodoc
class _$UserDeleteModelCopyWithImpl<$Res, $Val extends UserDeleteModel>
    implements $UserDeleteModelCopyWith<$Res> {
  _$UserDeleteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDeleteModelImplCopyWith<$Res>
    implements $UserDeleteModelCopyWith<$Res> {
  factory _$$UserDeleteModelImplCopyWith(_$UserDeleteModelImpl value,
          $Res Function(_$UserDeleteModelImpl) then) =
      __$$UserDeleteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String message, Bool? data});
}

/// @nodoc
class __$$UserDeleteModelImplCopyWithImpl<$Res>
    extends _$UserDeleteModelCopyWithImpl<$Res, _$UserDeleteModelImpl>
    implements _$$UserDeleteModelImplCopyWith<$Res> {
  __$$UserDeleteModelImplCopyWithImpl(
      _$UserDeleteModelImpl _value, $Res Function(_$UserDeleteModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$UserDeleteModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDeleteModelImpl implements _UserDeleteModel {
  _$UserDeleteModelImpl(
      {required this.code, required this.message, required this.data});

  factory _$UserDeleteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDeleteModelImplFromJson(json);

  @override
  final String code;
  @override
  final String message;
  @override
  final Bool? data;

  @override
  String toString() {
    return 'UserDeleteModel(code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDeleteModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDeleteModelImplCopyWith<_$UserDeleteModelImpl> get copyWith =>
      __$$UserDeleteModelImplCopyWithImpl<_$UserDeleteModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDeleteModelImplToJson(
      this,
    );
  }
}

abstract class _UserDeleteModel implements UserDeleteModel {
  factory _UserDeleteModel(
      {required final String code,
      required final String message,
      required final Bool? data}) = _$UserDeleteModelImpl;

  factory _UserDeleteModel.fromJson(Map<String, dynamic> json) =
      _$UserDeleteModelImpl.fromJson;

  @override
  String get code;
  @override
  String get message;
  @override
  Bool? get data;
  @override
  @JsonKey(ignore: true)
  _$$UserDeleteModelImplCopyWith<_$UserDeleteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
