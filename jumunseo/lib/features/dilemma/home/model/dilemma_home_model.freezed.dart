// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dilemma_home_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DilemmaHomeModel _$DilemmaHomeModelFromJson(Map<String, dynamic> json) {
  return _DilemmaHomeModel.fromJson(json);
}

/// @nodoc
mixin _$DilemmaHomeModel {
  int? get id => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DilemmaHomeModelCopyWith<DilemmaHomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DilemmaHomeModelCopyWith<$Res> {
  factory $DilemmaHomeModelCopyWith(
          DilemmaHomeModel value, $Res Function(DilemmaHomeModel) then) =
      _$DilemmaHomeModelCopyWithImpl<$Res, DilemmaHomeModel>;
  @useResult
  $Res call({int? id, String contents, String startTime, String endTime});
}

/// @nodoc
class _$DilemmaHomeModelCopyWithImpl<$Res, $Val extends DilemmaHomeModel>
    implements $DilemmaHomeModelCopyWith<$Res> {
  _$DilemmaHomeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? contents = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DilemmaHomeModelImplCopyWith<$Res>
    implements $DilemmaHomeModelCopyWith<$Res> {
  factory _$$DilemmaHomeModelImplCopyWith(_$DilemmaHomeModelImpl value,
          $Res Function(_$DilemmaHomeModelImpl) then) =
      __$$DilemmaHomeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String contents, String startTime, String endTime});
}

/// @nodoc
class __$$DilemmaHomeModelImplCopyWithImpl<$Res>
    extends _$DilemmaHomeModelCopyWithImpl<$Res, _$DilemmaHomeModelImpl>
    implements _$$DilemmaHomeModelImplCopyWith<$Res> {
  __$$DilemmaHomeModelImplCopyWithImpl(_$DilemmaHomeModelImpl _value,
      $Res Function(_$DilemmaHomeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? contents = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_$DilemmaHomeModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DilemmaHomeModelImpl implements _DilemmaHomeModel {
  _$DilemmaHomeModelImpl(
      {this.id,
      required this.contents,
      required this.startTime,
      required this.endTime});

  factory _$DilemmaHomeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DilemmaHomeModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String contents;
  @override
  final String startTime;
  @override
  final String endTime;

  @override
  String toString() {
    return 'DilemmaHomeModel(id: $id, contents: $contents, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DilemmaHomeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, contents, startTime, endTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DilemmaHomeModelImplCopyWith<_$DilemmaHomeModelImpl> get copyWith =>
      __$$DilemmaHomeModelImplCopyWithImpl<_$DilemmaHomeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DilemmaHomeModelImplToJson(
      this,
    );
  }
}

abstract class _DilemmaHomeModel implements DilemmaHomeModel {
  factory _DilemmaHomeModel(
      {final int? id,
      required final String contents,
      required final String startTime,
      required final String endTime}) = _$DilemmaHomeModelImpl;

  factory _DilemmaHomeModel.fromJson(Map<String, dynamic> json) =
      _$DilemmaHomeModelImpl.fromJson;

  @override
  int? get id;
  @override
  String get contents;
  @override
  String get startTime;
  @override
  String get endTime;
  @override
  @JsonKey(ignore: true)
  _$$DilemmaHomeModelImplCopyWith<_$DilemmaHomeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
