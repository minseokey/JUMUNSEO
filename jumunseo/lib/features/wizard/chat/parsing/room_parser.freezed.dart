// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_parser.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoomParser _$RoomParserFromJson(Map<String, dynamic> json) {
  return _RoomParser.fromJson(json);
}

/// @nodoc
mixin _$RoomParser {
  String get id => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get roomId => throw _privateConstructorUsedError;
  String get addedPrompt => throw _privateConstructorUsedError;
  List<ConversationParser> get conversation =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomParserCopyWith<RoomParser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomParserCopyWith<$Res> {
  factory $RoomParserCopyWith(
          RoomParser value, $Res Function(RoomParser) then) =
      _$RoomParserCopyWithImpl<$Res, RoomParser>;
  @useResult
  $Res call(
      {String id,
      String startTime,
      String userId,
      String roomId,
      String addedPrompt,
      List<ConversationParser> conversation});
}

/// @nodoc
class _$RoomParserCopyWithImpl<$Res, $Val extends RoomParser>
    implements $RoomParserCopyWith<$Res> {
  _$RoomParserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? userId = null,
    Object? roomId = null,
    Object? addedPrompt = null,
    Object? conversation = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      addedPrompt: null == addedPrompt
          ? _value.addedPrompt
          : addedPrompt // ignore: cast_nullable_to_non_nullable
              as String,
      conversation: null == conversation
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as List<ConversationParser>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomParserImplCopyWith<$Res>
    implements $RoomParserCopyWith<$Res> {
  factory _$$RoomParserImplCopyWith(
          _$RoomParserImpl value, $Res Function(_$RoomParserImpl) then) =
      __$$RoomParserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String startTime,
      String userId,
      String roomId,
      String addedPrompt,
      List<ConversationParser> conversation});
}

/// @nodoc
class __$$RoomParserImplCopyWithImpl<$Res>
    extends _$RoomParserCopyWithImpl<$Res, _$RoomParserImpl>
    implements _$$RoomParserImplCopyWith<$Res> {
  __$$RoomParserImplCopyWithImpl(
      _$RoomParserImpl _value, $Res Function(_$RoomParserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? userId = null,
    Object? roomId = null,
    Object? addedPrompt = null,
    Object? conversation = null,
  }) {
    return _then(_$RoomParserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      addedPrompt: null == addedPrompt
          ? _value.addedPrompt
          : addedPrompt // ignore: cast_nullable_to_non_nullable
              as String,
      conversation: null == conversation
          ? _value._conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as List<ConversationParser>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomParserImpl implements _RoomParser {
  _$RoomParserImpl(
      {required this.id,
      required this.startTime,
      required this.userId,
      required this.roomId,
      required this.addedPrompt,
      required final List<ConversationParser> conversation})
      : _conversation = conversation;

  factory _$RoomParserImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomParserImplFromJson(json);

  @override
  final String id;
  @override
  final String startTime;
  @override
  final String userId;
  @override
  final String roomId;
  @override
  final String addedPrompt;
  final List<ConversationParser> _conversation;
  @override
  List<ConversationParser> get conversation {
    if (_conversation is EqualUnmodifiableListView) return _conversation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversation);
  }

  @override
  String toString() {
    return 'RoomParser(id: $id, startTime: $startTime, userId: $userId, roomId: $roomId, addedPrompt: $addedPrompt, conversation: $conversation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomParserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.addedPrompt, addedPrompt) ||
                other.addedPrompt == addedPrompt) &&
            const DeepCollectionEquality()
                .equals(other._conversation, _conversation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, startTime, userId, roomId,
      addedPrompt, const DeepCollectionEquality().hash(_conversation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomParserImplCopyWith<_$RoomParserImpl> get copyWith =>
      __$$RoomParserImplCopyWithImpl<_$RoomParserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomParserImplToJson(
      this,
    );
  }
}

abstract class _RoomParser implements RoomParser {
  factory _RoomParser(
      {required final String id,
      required final String startTime,
      required final String userId,
      required final String roomId,
      required final String addedPrompt,
      required final List<ConversationParser> conversation}) = _$RoomParserImpl;

  factory _RoomParser.fromJson(Map<String, dynamic> json) =
      _$RoomParserImpl.fromJson;

  @override
  String get id;
  @override
  String get startTime;
  @override
  String get userId;
  @override
  String get roomId;
  @override
  String get addedPrompt;
  @override
  List<ConversationParser> get conversation;
  @override
  @JsonKey(ignore: true)
  _$$RoomParserImplCopyWith<_$RoomParserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
