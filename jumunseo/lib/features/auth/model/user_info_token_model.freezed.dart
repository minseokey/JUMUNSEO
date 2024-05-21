// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserInfoTokenModel _$UserInfoTokenModelFromJson(Map<String, dynamic> json) {
  return _UserInfoTokenModel.fromJson(json);
}

/// @nodoc
mixin _$UserInfoTokenModel {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  DateTime get accessTokenExpiredDate => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoTokenModelCopyWith<UserInfoTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoTokenModelCopyWith<$Res> {
  factory $UserInfoTokenModelCopyWith(
          UserInfoTokenModel value, $Res Function(UserInfoTokenModel) then) =
      _$UserInfoTokenModelCopyWithImpl<$Res, UserInfoTokenModel>;
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      DateTime accessTokenExpiredDate,
      String role});
}

/// @nodoc
class _$UserInfoTokenModelCopyWithImpl<$Res, $Val extends UserInfoTokenModel>
    implements $UserInfoTokenModelCopyWith<$Res> {
  _$UserInfoTokenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? accessTokenExpiredDate = null,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessTokenExpiredDate: null == accessTokenExpiredDate
          ? _value.accessTokenExpiredDate
          : accessTokenExpiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInfoTokenModelImplCopyWith<$Res>
    implements $UserInfoTokenModelCopyWith<$Res> {
  factory _$$UserInfoTokenModelImplCopyWith(_$UserInfoTokenModelImpl value,
          $Res Function(_$UserInfoTokenModelImpl) then) =
      __$$UserInfoTokenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      DateTime accessTokenExpiredDate,
      String role});
}

/// @nodoc
class __$$UserInfoTokenModelImplCopyWithImpl<$Res>
    extends _$UserInfoTokenModelCopyWithImpl<$Res, _$UserInfoTokenModelImpl>
    implements _$$UserInfoTokenModelImplCopyWith<$Res> {
  __$$UserInfoTokenModelImplCopyWithImpl(_$UserInfoTokenModelImpl _value,
      $Res Function(_$UserInfoTokenModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? accessTokenExpiredDate = null,
    Object? role = null,
  }) {
    return _then(_$UserInfoTokenModelImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessTokenExpiredDate: null == accessTokenExpiredDate
          ? _value.accessTokenExpiredDate
          : accessTokenExpiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoTokenModelImpl implements _UserInfoTokenModel {
  _$UserInfoTokenModelImpl(
      {required this.accessToken,
      required this.refreshToken,
      required this.accessTokenExpiredDate,
      required this.role});

  factory _$UserInfoTokenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoTokenModelImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final DateTime accessTokenExpiredDate;
  @override
  final String role;

  @override
  String toString() {
    return 'UserInfoTokenModel(accessToken: $accessToken, refreshToken: $refreshToken, accessTokenExpiredDate: $accessTokenExpiredDate, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoTokenModelImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.accessTokenExpiredDate, accessTokenExpiredDate) ||
                other.accessTokenExpiredDate == accessTokenExpiredDate) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, accessToken, refreshToken, accessTokenExpiredDate, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoTokenModelImplCopyWith<_$UserInfoTokenModelImpl> get copyWith =>
      __$$UserInfoTokenModelImplCopyWithImpl<_$UserInfoTokenModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoTokenModelImplToJson(
      this,
    );
  }
}

abstract class _UserInfoTokenModel implements UserInfoTokenModel {
  factory _UserInfoTokenModel(
      {required final String accessToken,
      required final String refreshToken,
      required final DateTime accessTokenExpiredDate,
      required final String role}) = _$UserInfoTokenModelImpl;

  factory _UserInfoTokenModel.fromJson(Map<String, dynamic> json) =
      _$UserInfoTokenModelImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  DateTime get accessTokenExpiredDate;
  @override
  String get role;
  @override
  @JsonKey(ignore: true)
  _$$UserInfoTokenModelImplCopyWith<_$UserInfoTokenModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
