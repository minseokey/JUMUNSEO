// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignInResponseModel _$SignInResponseModelFromJson(Map<String, dynamic> json) {
  return _SignInResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SignInResponseModel {
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  TokenModel get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInResponseModelCopyWith<SignInResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInResponseModelCopyWith<$Res> {
  factory $SignInResponseModelCopyWith(
          SignInResponseModel value, $Res Function(SignInResponseModel) then) =
      _$SignInResponseModelCopyWithImpl<$Res, SignInResponseModel>;
  @useResult
  $Res call({String code, String message, TokenModel data});

  $TokenModelCopyWith<$Res> get data;
}

/// @nodoc
class _$SignInResponseModelCopyWithImpl<$Res, $Val extends SignInResponseModel>
    implements $SignInResponseModelCopyWith<$Res> {
  _$SignInResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? data = null,
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
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TokenModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TokenModelCopyWith<$Res> get data {
    return $TokenModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignInResponseModelImplCopyWith<$Res>
    implements $SignInResponseModelCopyWith<$Res> {
  factory _$$SignInResponseModelImplCopyWith(_$SignInResponseModelImpl value,
          $Res Function(_$SignInResponseModelImpl) then) =
      __$$SignInResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String message, TokenModel data});

  @override
  $TokenModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$SignInResponseModelImplCopyWithImpl<$Res>
    extends _$SignInResponseModelCopyWithImpl<$Res, _$SignInResponseModelImpl>
    implements _$$SignInResponseModelImplCopyWith<$Res> {
  __$$SignInResponseModelImplCopyWithImpl(_$SignInResponseModelImpl _value,
      $Res Function(_$SignInResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$SignInResponseModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TokenModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInResponseModelImpl implements _SignInResponseModel {
  _$SignInResponseModelImpl(
      {required this.code, required this.message, required this.data});

  factory _$SignInResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInResponseModelImplFromJson(json);

  @override
  final String code;
  @override
  final String message;
  @override
  final TokenModel data;

  @override
  String toString() {
    return 'SignInResponseModel(code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInResponseModelImpl &&
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
  _$$SignInResponseModelImplCopyWith<_$SignInResponseModelImpl> get copyWith =>
      __$$SignInResponseModelImplCopyWithImpl<_$SignInResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInResponseModelImplToJson(
      this,
    );
  }
}

abstract class _SignInResponseModel implements SignInResponseModel {
  factory _SignInResponseModel(
      {required final String code,
      required final String message,
      required final TokenModel data}) = _$SignInResponseModelImpl;

  factory _SignInResponseModel.fromJson(Map<String, dynamic> json) =
      _$SignInResponseModelImpl.fromJson;

  @override
  String get code;
  @override
  String get message;
  @override
  TokenModel get data;
  @override
  @JsonKey(ignore: true)
  _$$SignInResponseModelImplCopyWith<_$SignInResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
