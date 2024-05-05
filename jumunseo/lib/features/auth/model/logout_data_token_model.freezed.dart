// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_data_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LogoutDataTokenModel _$LogoutDataTokenModelFromJson(Map<String, dynamic> json) {
  return _LogoutDataTokenModel.fromJson(json);
}

/// @nodoc
mixin _$LogoutDataTokenModel {
  String get email => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogoutDataTokenModelCopyWith<LogoutDataTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogoutDataTokenModelCopyWith<$Res> {
  factory $LogoutDataTokenModelCopyWith(LogoutDataTokenModel value,
          $Res Function(LogoutDataTokenModel) then) =
      _$LogoutDataTokenModelCopyWithImpl<$Res, LogoutDataTokenModel>;
  @useResult
  $Res call({String email, String role, String name});
}

/// @nodoc
class _$LogoutDataTokenModelCopyWithImpl<$Res,
        $Val extends LogoutDataTokenModel>
    implements $LogoutDataTokenModelCopyWith<$Res> {
  _$LogoutDataTokenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? role = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogoutDataTokenModelImplCopyWith<$Res>
    implements $LogoutDataTokenModelCopyWith<$Res> {
  factory _$$LogoutDataTokenModelImplCopyWith(_$LogoutDataTokenModelImpl value,
          $Res Function(_$LogoutDataTokenModelImpl) then) =
      __$$LogoutDataTokenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String role, String name});
}

/// @nodoc
class __$$LogoutDataTokenModelImplCopyWithImpl<$Res>
    extends _$LogoutDataTokenModelCopyWithImpl<$Res, _$LogoutDataTokenModelImpl>
    implements _$$LogoutDataTokenModelImplCopyWith<$Res> {
  __$$LogoutDataTokenModelImplCopyWithImpl(_$LogoutDataTokenModelImpl _value,
      $Res Function(_$LogoutDataTokenModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? role = null,
    Object? name = null,
  }) {
    return _then(_$LogoutDataTokenModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogoutDataTokenModelImpl implements _LogoutDataTokenModel {
  _$LogoutDataTokenModelImpl(
      {required this.email, required this.role, required this.name});

  factory _$LogoutDataTokenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogoutDataTokenModelImplFromJson(json);

  @override
  final String email;
  @override
  final String role;
  @override
  final String name;

  @override
  String toString() {
    return 'LogoutDataTokenModel(email: $email, role: $role, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogoutDataTokenModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, role, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogoutDataTokenModelImplCopyWith<_$LogoutDataTokenModelImpl>
      get copyWith =>
          __$$LogoutDataTokenModelImplCopyWithImpl<_$LogoutDataTokenModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogoutDataTokenModelImplToJson(
      this,
    );
  }
}

abstract class _LogoutDataTokenModel implements LogoutDataTokenModel {
  factory _LogoutDataTokenModel(
      {required final String email,
      required final String role,
      required final String name}) = _$LogoutDataTokenModelImpl;

  factory _LogoutDataTokenModel.fromJson(Map<String, dynamic> json) =
      _$LogoutDataTokenModelImpl.fromJson;

  @override
  String get email;
  @override
  String get role;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$LogoutDataTokenModelImplCopyWith<_$LogoutDataTokenModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
