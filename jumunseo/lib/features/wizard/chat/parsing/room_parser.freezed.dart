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
  String get start_time => throw _privateConstructorUsedError;
  String get user_id => throw _privateConstructorUsedError;
  String get room_id => throw _privateConstructorUsedError;
  String get added_prompt => throw _privateConstructorUsedError;
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
      String start_time,
      String user_id,
      String room_id,
      String added_prompt,
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
    Object? start_time = null,
    Object? user_id = null,
    Object? room_id = null,
    Object? added_prompt = null,
    Object? conversation = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      start_time: null == start_time
          ? _value.start_time
          : start_time // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      room_id: null == room_id
          ? _value.room_id
          : room_id // ignore: cast_nullable_to_non_nullable
              as String,
      added_prompt: null == added_prompt
          ? _value.added_prompt
          : added_prompt // ignore: cast_nullable_to_non_nullable
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
      String start_time,
      String user_id,
      String room_id,
      String added_prompt,
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
    Object? start_time = null,
    Object? user_id = null,
    Object? room_id = null,
    Object? added_prompt = null,
    Object? conversation = null,
  }) {
    return _then(_$RoomParserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      start_time: null == start_time
          ? _value.start_time
          : start_time // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      room_id: null == room_id
          ? _value.room_id
          : room_id // ignore: cast_nullable_to_non_nullable
              as String,
      added_prompt: null == added_prompt
          ? _value.added_prompt
          : added_prompt // ignore: cast_nullable_to_non_nullable
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
      required this.start_time,
      required this.user_id,
      required this.room_id,
      required this.added_prompt,
      required final List<ConversationParser> conversation})
      : _conversation = conversation;

  factory _$RoomParserImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomParserImplFromJson(json);

  @override
  final String id;
  @override
  final String start_time;
  @override
  final String user_id;
  @override
  final String room_id;
  @override
  final String added_prompt;
  final List<ConversationParser> _conversation;
  @override
  List<ConversationParser> get conversation {
    if (_conversation is EqualUnmodifiableListView) return _conversation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversation);
  }

  @override
  String toString() {
    return 'RoomParser(_id: $id, start_time: $start_time, user_id: $user_id, room_id: $room_id, added_prompt: $added_prompt, conversation: $conversation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomParserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.start_time, start_time) ||
                other.start_time == start_time) &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.room_id, room_id) || other.room_id == room_id) &&
            (identical(other.added_prompt, added_prompt) ||
                other.added_prompt == added_prompt) &&
            const DeepCollectionEquality()
                .equals(other._conversation, _conversation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, start_time, user_id, room_id,
      added_prompt, const DeepCollectionEquality().hash(_conversation));

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
      required final String start_time,
      required final String user_id,
      required final String room_id,
      required final String added_prompt,
      required final List<ConversationParser> conversation}) = _$RoomParserImpl;

  factory _RoomParser.fromJson(Map<String, dynamic> json) =
      _$RoomParserImpl.fromJson;

  @override
  String get id;
  @override
  String get start_time;
  @override
  String get user_id;
  @override
  String get room_id;
  @override
  String get added_prompt;
  @override
  List<ConversationParser> get conversation;
  @override
  @JsonKey(ignore: true)
  _$$RoomParserImplCopyWith<_$RoomParserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
