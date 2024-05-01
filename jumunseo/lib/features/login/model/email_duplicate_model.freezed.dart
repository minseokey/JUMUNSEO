// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_duplicate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmailDuplicateModel _$EmailDuplicateModelFromJson(Map<String, dynamic> json) {
  return _EmailDuplicateModel.fromJson(json);
}

/// @nodoc
mixin _$EmailDuplicateModel {
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Bool get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailDuplicateModelCopyWith<EmailDuplicateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailDuplicateModelCopyWith<$Res> {
  factory $EmailDuplicateModelCopyWith(
          EmailDuplicateModel value, $Res Function(EmailDuplicateModel) then) =
      _$EmailDuplicateModelCopyWithImpl<$Res, EmailDuplicateModel>;
  @useResult
  $Res call({String code, String message, Bool data});
}

/// @nodoc
class _$EmailDuplicateModelCopyWithImpl<$Res, $Val extends EmailDuplicateModel>
    implements $EmailDuplicateModelCopyWith<$Res> {
  _$EmailDuplicateModelCopyWithImpl(this._value, this._then);

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
              as Bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailDuplicateModelImplCopyWith<$Res>
    implements $EmailDuplicateModelCopyWith<$Res> {
  factory _$$EmailDuplicateModelImplCopyWith(_$EmailDuplicateModelImpl value,
          $Res Function(_$EmailDuplicateModelImpl) then) =
      __$$EmailDuplicateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String message, Bool data});
}

/// @nodoc
class __$$EmailDuplicateModelImplCopyWithImpl<$Res>
    extends _$EmailDuplicateModelCopyWithImpl<$Res, _$EmailDuplicateModelImpl>
    implements _$$EmailDuplicateModelImplCopyWith<$Res> {
  __$$EmailDuplicateModelImplCopyWithImpl(_$EmailDuplicateModelImpl _value,
      $Res Function(_$EmailDuplicateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$EmailDuplicateModelImpl(
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
              as Bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailDuplicateModelImpl implements _EmailDuplicateModel {
  _$EmailDuplicateModelImpl(
      {required this.code, required this.message, required this.data});

  factory _$EmailDuplicateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmailDuplicateModelImplFromJson(json);

  @override
  final String code;
  @override
  final String message;
  @override
  final Bool data;

  @override
  String toString() {
    return 'EmailDuplicateModel(code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailDuplicateModelImpl &&
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
  _$$EmailDuplicateModelImplCopyWith<_$EmailDuplicateModelImpl> get copyWith =>
      __$$EmailDuplicateModelImplCopyWithImpl<_$EmailDuplicateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailDuplicateModelImplToJson(
      this,
    );
  }
}

abstract class _EmailDuplicateModel implements EmailDuplicateModel {
  factory _EmailDuplicateModel(
      {required final String code,
      required final String message,
      required final Bool data}) = _$EmailDuplicateModelImpl;

  factory _EmailDuplicateModel.fromJson(Map<String, dynamic> json) =
      _$EmailDuplicateModelImpl.fromJson;

  @override
  String get code;
  @override
  String get message;
  @override
  Bool get data;
  @override
  @JsonKey(ignore: true)
  _$$EmailDuplicateModelImplCopyWith<_$EmailDuplicateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
