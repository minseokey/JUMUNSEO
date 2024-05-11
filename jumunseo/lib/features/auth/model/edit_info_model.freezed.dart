// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EditInfoModel _$EditInfoModelFromJson(Map<String, dynamic> json) {
  return _EditInfoModel.fromJson(json);
}

/// @nodoc
mixin _$EditInfoModel {
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditInfoModelCopyWith<EditInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditInfoModelCopyWith<$Res> {
  factory $EditInfoModelCopyWith(
          EditInfoModel value, $Res Function(EditInfoModel) then) =
      _$EditInfoModelCopyWithImpl<$Res, EditInfoModel>;
  @useResult
  $Res call(
      {String email, String name, String accessToken, String refreshToken});
}

/// @nodoc
class _$EditInfoModelCopyWithImpl<$Res, $Val extends EditInfoModel>
    implements $EditInfoModelCopyWith<$Res> {
  _$EditInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditInfoModelImplCopyWith<$Res>
    implements $EditInfoModelCopyWith<$Res> {
  factory _$$EditInfoModelImplCopyWith(
          _$EditInfoModelImpl value, $Res Function(_$EditInfoModelImpl) then) =
      __$$EditInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email, String name, String accessToken, String refreshToken});
}

/// @nodoc
class __$$EditInfoModelImplCopyWithImpl<$Res>
    extends _$EditInfoModelCopyWithImpl<$Res, _$EditInfoModelImpl>
    implements _$$EditInfoModelImplCopyWith<$Res> {
  __$$EditInfoModelImplCopyWithImpl(
      _$EditInfoModelImpl _value, $Res Function(_$EditInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$EditInfoModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditInfoModelImpl implements _EditInfoModel {
  _$EditInfoModelImpl(
      {required this.email,
      required this.name,
      required this.accessToken,
      required this.refreshToken});

  factory _$EditInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditInfoModelImplFromJson(json);

  @override
  final String email;
  @override
  final String name;
  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'EditInfoModel(email: $email, name: $name, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditInfoModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, name, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditInfoModelImplCopyWith<_$EditInfoModelImpl> get copyWith =>
      __$$EditInfoModelImplCopyWithImpl<_$EditInfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditInfoModelImplToJson(
      this,
    );
  }
}

abstract class _EditInfoModel implements EditInfoModel {
  factory _EditInfoModel(
      {required final String email,
      required final String name,
      required final String accessToken,
      required final String refreshToken}) = _$EditInfoModelImpl;

  factory _EditInfoModel.fromJson(Map<String, dynamic> json) =
      _$EditInfoModelImpl.fromJson;

  @override
  String get email;
  @override
  String get name;
  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$EditInfoModelImplCopyWith<_$EditInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
