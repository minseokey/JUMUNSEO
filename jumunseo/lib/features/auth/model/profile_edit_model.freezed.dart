// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_edit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileEditModel _$ProfileEditModelFromJson(Map<String, dynamic> json) {
  return _ProfileEditModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileEditModel {
  String get name => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileEditModelCopyWith<ProfileEditModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEditModelCopyWith<$Res> {
  factory $ProfileEditModelCopyWith(
          ProfileEditModel value, $Res Function(ProfileEditModel) then) =
      _$ProfileEditModelCopyWithImpl<$Res, ProfileEditModel>;
  @useResult
  $Res call({String name, String password});
}

/// @nodoc
class _$ProfileEditModelCopyWithImpl<$Res, $Val extends ProfileEditModel>
    implements $ProfileEditModelCopyWith<$Res> {
  _$ProfileEditModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileEditModelImplCopyWith<$Res>
    implements $ProfileEditModelCopyWith<$Res> {
  factory _$$ProfileEditModelImplCopyWith(_$ProfileEditModelImpl value,
          $Res Function(_$ProfileEditModelImpl) then) =
      __$$ProfileEditModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String password});
}

/// @nodoc
class __$$ProfileEditModelImplCopyWithImpl<$Res>
    extends _$ProfileEditModelCopyWithImpl<$Res, _$ProfileEditModelImpl>
    implements _$$ProfileEditModelImplCopyWith<$Res> {
  __$$ProfileEditModelImplCopyWithImpl(_$ProfileEditModelImpl _value,
      $Res Function(_$ProfileEditModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? password = null,
  }) {
    return _then(_$ProfileEditModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileEditModelImpl implements _ProfileEditModel {
  _$ProfileEditModelImpl({required this.name, required this.password});

  factory _$ProfileEditModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileEditModelImplFromJson(json);

  @override
  final String name;
  @override
  final String password;

  @override
  String toString() {
    return 'ProfileEditModel(name: $name, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEditModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileEditModelImplCopyWith<_$ProfileEditModelImpl> get copyWith =>
      __$$ProfileEditModelImplCopyWithImpl<_$ProfileEditModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileEditModelImplToJson(
      this,
    );
  }
}

abstract class _ProfileEditModel implements ProfileEditModel {
  factory _ProfileEditModel(
      {required final String name,
      required final String password}) = _$ProfileEditModelImpl;

  factory _ProfileEditModel.fromJson(Map<String, dynamic> json) =
      _$ProfileEditModelImpl.fromJson;

  @override
  String get name;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$ProfileEditModelImplCopyWith<_$ProfileEditModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
