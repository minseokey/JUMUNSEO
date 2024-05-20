// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dilemma_chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DilemmaChatModel _$DilemmaChatModelFromJson(Map<String, dynamic> json) {
  return _DilemmaChatModel.fromJson(json);
}

/// @nodoc
mixin _$DilemmaChatModel {
  int? get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get side => throw _privateConstructorUsedError;
  String get userEmail => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DilemmaChatModelCopyWith<DilemmaChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DilemmaChatModelCopyWith<$Res> {
  factory $DilemmaChatModelCopyWith(
          DilemmaChatModel value, $Res Function(DilemmaChatModel) then) =
      _$DilemmaChatModelCopyWithImpl<$Res, DilemmaChatModel>;
  @useResult
  $Res call(
      {int? id, String type, String side, String userEmail, String content});
}

/// @nodoc
class _$DilemmaChatModelCopyWithImpl<$Res, $Val extends DilemmaChatModel>
    implements $DilemmaChatModelCopyWith<$Res> {
  _$DilemmaChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = null,
    Object? side = null,
    Object? userEmail = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      side: null == side
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DilemmaChatModelImplCopyWith<$Res>
    implements $DilemmaChatModelCopyWith<$Res> {
  factory _$$DilemmaChatModelImplCopyWith(_$DilemmaChatModelImpl value,
          $Res Function(_$DilemmaChatModelImpl) then) =
      __$$DilemmaChatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id, String type, String side, String userEmail, String content});
}

/// @nodoc
class __$$DilemmaChatModelImplCopyWithImpl<$Res>
    extends _$DilemmaChatModelCopyWithImpl<$Res, _$DilemmaChatModelImpl>
    implements _$$DilemmaChatModelImplCopyWith<$Res> {
  __$$DilemmaChatModelImplCopyWithImpl(_$DilemmaChatModelImpl _value,
      $Res Function(_$DilemmaChatModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = null,
    Object? side = null,
    Object? userEmail = null,
    Object? content = null,
  }) {
    return _then(_$DilemmaChatModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      side: null == side
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DilemmaChatModelImpl implements _DilemmaChatModel {
  _$DilemmaChatModelImpl(
      {this.id,
      required this.type,
      required this.side,
      required this.userEmail,
      required this.content});

  factory _$DilemmaChatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DilemmaChatModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String type;
  @override
  final String side;
  @override
  final String userEmail;
  @override
  final String content;

  @override
  String toString() {
    return 'DilemmaChatModel(id: $id, type: $type, side: $side, userEmail: $userEmail, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DilemmaChatModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.side, side) || other.side == side) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, side, userEmail, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DilemmaChatModelImplCopyWith<_$DilemmaChatModelImpl> get copyWith =>
      __$$DilemmaChatModelImplCopyWithImpl<_$DilemmaChatModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DilemmaChatModelImplToJson(
      this,
    );
  }
}

abstract class _DilemmaChatModel implements DilemmaChatModel {
  factory _DilemmaChatModel(
      {final int? id,
      required final String type,
      required final String side,
      required final String userEmail,
      required final String content}) = _$DilemmaChatModelImpl;

  factory _DilemmaChatModel.fromJson(Map<String, dynamic> json) =
      _$DilemmaChatModelImpl.fromJson;

  @override
  int? get id;
  @override
  String get type;
  @override
  String get side;
  @override
  String get userEmail;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$DilemmaChatModelImplCopyWith<_$DilemmaChatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
