// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dilemma_chat_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DilemmaChatUserModel _$DilemmaChatUserModelFromJson(Map<String, dynamic> json) {
  return _DilemmaChatUserModel.fromJson(json);
}

/// @nodoc
mixin _$DilemmaChatUserModel {
  String get userId => throw _privateConstructorUsedError;
  String get userNickname => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DilemmaChatUserModelCopyWith<DilemmaChatUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DilemmaChatUserModelCopyWith<$Res> {
  factory $DilemmaChatUserModelCopyWith(DilemmaChatUserModel value,
          $Res Function(DilemmaChatUserModel) then) =
      _$DilemmaChatUserModelCopyWithImpl<$Res, DilemmaChatUserModel>;
  @useResult
  $Res call({String userId, String userNickname, String? profileImage});
}

/// @nodoc
class _$DilemmaChatUserModelCopyWithImpl<$Res,
        $Val extends DilemmaChatUserModel>
    implements $DilemmaChatUserModelCopyWith<$Res> {
  _$DilemmaChatUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userNickname = null,
    Object? profileImage = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userNickname: null == userNickname
          ? _value.userNickname
          : userNickname // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DilemmaChatUserModelImplCopyWith<$Res>
    implements $DilemmaChatUserModelCopyWith<$Res> {
  factory _$$DilemmaChatUserModelImplCopyWith(_$DilemmaChatUserModelImpl value,
          $Res Function(_$DilemmaChatUserModelImpl) then) =
      __$$DilemmaChatUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String userNickname, String? profileImage});
}

/// @nodoc
class __$$DilemmaChatUserModelImplCopyWithImpl<$Res>
    extends _$DilemmaChatUserModelCopyWithImpl<$Res, _$DilemmaChatUserModelImpl>
    implements _$$DilemmaChatUserModelImplCopyWith<$Res> {
  __$$DilemmaChatUserModelImplCopyWithImpl(_$DilemmaChatUserModelImpl _value,
      $Res Function(_$DilemmaChatUserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userNickname = null,
    Object? profileImage = freezed,
  }) {
    return _then(_$DilemmaChatUserModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userNickname: null == userNickname
          ? _value.userNickname
          : userNickname // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DilemmaChatUserModelImpl implements _DilemmaChatUserModel {
  _$DilemmaChatUserModelImpl(
      {required this.userId, required this.userNickname, this.profileImage});

  factory _$DilemmaChatUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DilemmaChatUserModelImplFromJson(json);

  @override
  final String userId;
  @override
  final String userNickname;
  @override
  final String? profileImage;

  @override
  String toString() {
    return 'DilemmaChatUserModel(userId: $userId, userNickname: $userNickname, profileImage: $profileImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DilemmaChatUserModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userNickname, userNickname) ||
                other.userNickname == userNickname) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, userNickname, profileImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DilemmaChatUserModelImplCopyWith<_$DilemmaChatUserModelImpl>
      get copyWith =>
          __$$DilemmaChatUserModelImplCopyWithImpl<_$DilemmaChatUserModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DilemmaChatUserModelImplToJson(
      this,
    );
  }
}

abstract class _DilemmaChatUserModel implements DilemmaChatUserModel {
  factory _DilemmaChatUserModel(
      {required final String userId,
      required final String userNickname,
      final String? profileImage}) = _$DilemmaChatUserModelImpl;

  factory _DilemmaChatUserModel.fromJson(Map<String, dynamic> json) =
      _$DilemmaChatUserModelImpl.fromJson;

  @override
  String get userId;
  @override
  String get userNickname;
  @override
  String? get profileImage;
  @override
  @JsonKey(ignore: true)
  _$$DilemmaChatUserModelImplCopyWith<_$DilemmaChatUserModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
