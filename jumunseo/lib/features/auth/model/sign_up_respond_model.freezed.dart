// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_respond_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignUpRespondModel _$SignUpRespondModelFromJson(Map<String, dynamic> json) {
  return _SignUpRespondModel.fromJson(json);
}

/// @nodoc
mixin _$SignUpRespondModel {
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpRespondModelCopyWith<SignUpRespondModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpRespondModelCopyWith<$Res> {
  factory $SignUpRespondModelCopyWith(
          SignUpRespondModel value, $Res Function(SignUpRespondModel) then) =
      _$SignUpRespondModelCopyWithImpl<$Res, SignUpRespondModel>;
  @useResult
  $Res call({String code, String message, String? data});
}

/// @nodoc
class _$SignUpRespondModelCopyWithImpl<$Res, $Val extends SignUpRespondModel>
    implements $SignUpRespondModelCopyWith<$Res> {
  _$SignUpRespondModelCopyWithImpl(this._value, this._then);

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
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpRespondModelImplCopyWith<$Res>
    implements $SignUpRespondModelCopyWith<$Res> {
  factory _$$SignUpRespondModelImplCopyWith(_$SignUpRespondModelImpl value,
          $Res Function(_$SignUpRespondModelImpl) then) =
      __$$SignUpRespondModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String message, String? data});
}

/// @nodoc
class __$$SignUpRespondModelImplCopyWithImpl<$Res>
    extends _$SignUpRespondModelCopyWithImpl<$Res, _$SignUpRespondModelImpl>
    implements _$$SignUpRespondModelImplCopyWith<$Res> {
  __$$SignUpRespondModelImplCopyWithImpl(_$SignUpRespondModelImpl _value,
      $Res Function(_$SignUpRespondModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$SignUpRespondModelImpl(
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
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpRespondModelImpl implements _SignUpRespondModel {
  _$SignUpRespondModelImpl(
      {required this.code, required this.message, required this.data});

  factory _$SignUpRespondModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpRespondModelImplFromJson(json);

  @override
  final String code;
  @override
  final String message;
  @override
  final String? data;

  @override
  String toString() {
    return 'SignUpRespondModel(code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpRespondModelImpl &&
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
  _$$SignUpRespondModelImplCopyWith<_$SignUpRespondModelImpl> get copyWith =>
      __$$SignUpRespondModelImplCopyWithImpl<_$SignUpRespondModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpRespondModelImplToJson(
      this,
    );
  }
}

abstract class _SignUpRespondModel implements SignUpRespondModel {
  factory _SignUpRespondModel(
      {required final String code,
      required final String message,
      required final String? data}) = _$SignUpRespondModelImpl;

  factory _SignUpRespondModel.fromJson(Map<String, dynamic> json) =
      _$SignUpRespondModelImpl.fromJson;

  @override
  String get code;
  @override
  String get message;
  @override
  String? get data;
  @override
  @JsonKey(ignore: true)
  _$$SignUpRespondModelImplCopyWith<_$SignUpRespondModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
