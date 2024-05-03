// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reissue_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReIssueTokenModel _$ReIssueTokenModelFromJson(Map<String, dynamic> json) {
  return _ReIssueTokenModel.fromJson(json);
}

/// @nodoc
mixin _$ReIssueTokenModel {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  String get accessTokenExpiredDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReIssueTokenModelCopyWith<ReIssueTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReIssueTokenModelCopyWith<$Res> {
  factory $ReIssueTokenModelCopyWith(
          ReIssueTokenModel value, $Res Function(ReIssueTokenModel) then) =
      _$ReIssueTokenModelCopyWithImpl<$Res, ReIssueTokenModel>;
  @useResult
  $Res call(
      {String accessToken, String refreshToken, String accessTokenExpiredDate});
}

/// @nodoc
class _$ReIssueTokenModelCopyWithImpl<$Res, $Val extends ReIssueTokenModel>
    implements $ReIssueTokenModelCopyWith<$Res> {
  _$ReIssueTokenModelCopyWithImpl(this._value, this._then);

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
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReIssueTokenModelImplCopyWith<$Res>
    implements $ReIssueTokenModelCopyWith<$Res> {
  factory _$$ReIssueTokenModelImplCopyWith(_$ReIssueTokenModelImpl value,
          $Res Function(_$ReIssueTokenModelImpl) then) =
      __$$ReIssueTokenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accessToken, String refreshToken, String accessTokenExpiredDate});
}

/// @nodoc
class __$$ReIssueTokenModelImplCopyWithImpl<$Res>
    extends _$ReIssueTokenModelCopyWithImpl<$Res, _$ReIssueTokenModelImpl>
    implements _$$ReIssueTokenModelImplCopyWith<$Res> {
  __$$ReIssueTokenModelImplCopyWithImpl(_$ReIssueTokenModelImpl _value,
      $Res Function(_$ReIssueTokenModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? accessTokenExpiredDate = null,
  }) {
    return _then(_$ReIssueTokenModelImpl(
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
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReIssueTokenModelImpl implements _ReIssueTokenModel {
  _$ReIssueTokenModelImpl(
      {required this.accessToken,
      required this.refreshToken,
      required this.accessTokenExpiredDate});

  factory _$ReIssueTokenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReIssueTokenModelImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final String accessTokenExpiredDate;

  @override
  String toString() {
    return 'ReIssueTokenModel(accessToken: $accessToken, refreshToken: $refreshToken, accessTokenExpiredDate: $accessTokenExpiredDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReIssueTokenModelImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.accessTokenExpiredDate, accessTokenExpiredDate) ||
                other.accessTokenExpiredDate == accessTokenExpiredDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, accessToken, refreshToken, accessTokenExpiredDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReIssueTokenModelImplCopyWith<_$ReIssueTokenModelImpl> get copyWith =>
      __$$ReIssueTokenModelImplCopyWithImpl<_$ReIssueTokenModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReIssueTokenModelImplToJson(
      this,
    );
  }
}

abstract class _ReIssueTokenModel implements ReIssueTokenModel {
  factory _ReIssueTokenModel(
      {required final String accessToken,
      required final String refreshToken,
      required final String accessTokenExpiredDate}) = _$ReIssueTokenModelImpl;

  factory _ReIssueTokenModel.fromJson(Map<String, dynamic> json) =
      _$ReIssueTokenModelImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  String get accessTokenExpiredDate;
  @override
  @JsonKey(ignore: true)
  _$$ReIssueTokenModelImplCopyWith<_$ReIssueTokenModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
