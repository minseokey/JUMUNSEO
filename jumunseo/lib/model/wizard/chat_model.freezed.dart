// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatParser _$ChatParserFromJson(Map<String, dynamic> json) {
  return _ChatParser.fromJson(json);
}

/// @nodoc
mixin _$ChatParser {
  List<RoomParser> get chats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatParserCopyWith<ChatParser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatParserCopyWith<$Res> {
  factory $ChatParserCopyWith(
          ChatParser value, $Res Function(ChatParser) then) =
      _$ChatParserCopyWithImpl<$Res, ChatParser>;
  @useResult
  $Res call({List<RoomParser> chats});
}

/// @nodoc
class _$ChatParserCopyWithImpl<$Res, $Val extends ChatParser>
    implements $ChatParserCopyWith<$Res> {
  _$ChatParserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
  }) {
    return _then(_value.copyWith(
      chats: null == chats
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<RoomParser>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatParserImplCopyWith<$Res>
    implements $ChatParserCopyWith<$Res> {
  factory _$$ChatParserImplCopyWith(
          _$ChatParserImpl value, $Res Function(_$ChatParserImpl) then) =
      __$$ChatParserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RoomParser> chats});
}

/// @nodoc
class __$$ChatParserImplCopyWithImpl<$Res>
    extends _$ChatParserCopyWithImpl<$Res, _$ChatParserImpl>
    implements _$$ChatParserImplCopyWith<$Res> {
  __$$ChatParserImplCopyWithImpl(
      _$ChatParserImpl _value, $Res Function(_$ChatParserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
  }) {
    return _then(_$ChatParserImpl(
      chats: null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<RoomParser>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatParserImpl implements _ChatParser {
  _$ChatParserImpl({required final List<RoomParser> chats}) : _chats = chats;

  factory _$ChatParserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatParserImplFromJson(json);

  final List<RoomParser> _chats;
  @override
  List<RoomParser> get chats {
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chats);
  }

  @override
  String toString() {
    return 'ChatParser(chats: $chats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatParserImpl &&
            const DeepCollectionEquality().equals(other._chats, _chats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_chats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatParserImplCopyWith<_$ChatParserImpl> get copyWith =>
      __$$ChatParserImplCopyWithImpl<_$ChatParserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatParserImplToJson(
      this,
    );
  }
}

abstract class _ChatParser implements ChatParser {
  factory _ChatParser({required final List<RoomParser> chats}) =
      _$ChatParserImpl;

  factory _ChatParser.fromJson(Map<String, dynamic> json) =
      _$ChatParserImpl.fromJson;

  @override
  List<RoomParser> get chats;
  @override
  @JsonKey(ignore: true)
  _$$ChatParserImplCopyWith<_$ChatParserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
