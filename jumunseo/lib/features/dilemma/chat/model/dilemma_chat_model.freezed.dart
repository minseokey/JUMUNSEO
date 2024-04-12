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
  String? get id => throw _privateConstructorUsedError;
  DateTime get sendTime => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  ChatType get chatType => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

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
      {String? id,
      DateTime sendTime,
      String userId,
      String userName,
      ChatType chatType,
      String? message});
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
    Object? sendTime = null,
    Object? userId = null,
    Object? userName = null,
    Object? chatType = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sendTime: null == sendTime
          ? _value.sendTime
          : sendTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      chatType: null == chatType
          ? _value.chatType
          : chatType // ignore: cast_nullable_to_non_nullable
              as ChatType,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {String? id,
      DateTime sendTime,
      String userId,
      String userName,
      ChatType chatType,
      String? message});
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
    Object? sendTime = null,
    Object? userId = null,
    Object? userName = null,
    Object? chatType = null,
    Object? message = freezed,
  }) {
    return _then(_$DilemmaChatModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sendTime: null == sendTime
          ? _value.sendTime
          : sendTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      chatType: null == chatType
          ? _value.chatType
          : chatType // ignore: cast_nullable_to_non_nullable
              as ChatType,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DilemmaChatModelImpl implements _DilemmaChatModel {
  _$DilemmaChatModelImpl(
      {this.id,
      required this.sendTime,
      required this.userId,
      required this.userName,
      required this.chatType,
      this.message});

  factory _$DilemmaChatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DilemmaChatModelImplFromJson(json);

  @override
  final String? id;
  @override
  final DateTime sendTime;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final ChatType chatType;
  @override
  final String? message;

  @override
  String toString() {
    return 'DilemmaChatModel(id: $id, sendTime: $sendTime, userId: $userId, userName: $userName, chatType: $chatType, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DilemmaChatModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sendTime, sendTime) ||
                other.sendTime == sendTime) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.chatType, chatType) ||
                other.chatType == chatType) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, sendTime, userId, userName, chatType, message);

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
      {final String? id,
      required final DateTime sendTime,
      required final String userId,
      required final String userName,
      required final ChatType chatType,
      final String? message}) = _$DilemmaChatModelImpl;

  factory _DilemmaChatModel.fromJson(Map<String, dynamic> json) =
      _$DilemmaChatModelImpl.fromJson;

  @override
  String? get id;
  @override
  DateTime get sendTime;
  @override
  String get userId;
  @override
  String get userName;
  @override
  ChatType get chatType;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$DilemmaChatModelImplCopyWith<_$DilemmaChatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
