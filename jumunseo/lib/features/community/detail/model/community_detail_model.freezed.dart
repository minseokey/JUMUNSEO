// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommunityDetailModel _$CommunityDetailModelFromJson(Map<String, dynamic> json) {
  return _CommunityDetailModel.fromJson(json);
}

/// @nodoc
mixin _$CommunityDetailModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;
  DateTime? get updated_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommunityDetailModelCopyWith<CommunityDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityDetailModelCopyWith<$Res> {
  factory $CommunityDetailModelCopyWith(CommunityDetailModel value,
          $Res Function(CommunityDetailModel) then) =
      _$CommunityDetailModelCopyWithImpl<$Res, CommunityDetailModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String image,
      DateTime? created_at,
      DateTime? updated_at});
}

/// @nodoc
class _$CommunityDetailModelCopyWithImpl<$Res,
        $Val extends CommunityDetailModel>
    implements $CommunityDetailModelCopyWith<$Res> {
  _$CommunityDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? image = null,
    Object? created_at = freezed,
    Object? updated_at = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommunityDetailModelImplCopyWith<$Res>
    implements $CommunityDetailModelCopyWith<$Res> {
  factory _$$CommunityDetailModelImplCopyWith(_$CommunityDetailModelImpl value,
          $Res Function(_$CommunityDetailModelImpl) then) =
      __$$CommunityDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String image,
      DateTime? created_at,
      DateTime? updated_at});
}

/// @nodoc
class __$$CommunityDetailModelImplCopyWithImpl<$Res>
    extends _$CommunityDetailModelCopyWithImpl<$Res, _$CommunityDetailModelImpl>
    implements _$$CommunityDetailModelImplCopyWith<$Res> {
  __$$CommunityDetailModelImplCopyWithImpl(_$CommunityDetailModelImpl _value,
      $Res Function(_$CommunityDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? image = null,
    Object? created_at = freezed,
    Object? updated_at = freezed,
  }) {
    return _then(_$CommunityDetailModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunityDetailModelImpl implements _CommunityDetailModel {
  _$CommunityDetailModelImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      this.created_at,
      this.updated_at});

  factory _$CommunityDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunityDetailModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String image;
  @override
  final DateTime? created_at;
  @override
  final DateTime? updated_at;

  @override
  String toString() {
    return 'CommunityDetailModel(id: $id, name: $name, description: $description, image: $image, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, image, created_at, updated_at);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityDetailModelImplCopyWith<_$CommunityDetailModelImpl>
      get copyWith =>
          __$$CommunityDetailModelImplCopyWithImpl<_$CommunityDetailModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunityDetailModelImplToJson(
      this,
    );
  }
}

abstract class _CommunityDetailModel implements CommunityDetailModel {
  factory _CommunityDetailModel(
      {required final String id,
      required final String name,
      required final String description,
      required final String image,
      final DateTime? created_at,
      final DateTime? updated_at}) = _$CommunityDetailModelImpl;

  factory _CommunityDetailModel.fromJson(Map<String, dynamic> json) =
      _$CommunityDetailModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get image;
  @override
  DateTime? get created_at;
  @override
  DateTime? get updated_at;
  @override
  @JsonKey(ignore: true)
  _$$CommunityDetailModelImplCopyWith<_$CommunityDetailModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
