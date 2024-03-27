// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConversationParser _$ConversationParserFromJson(Map<String, dynamic> json) {
  return _ConversationParser.fromJson(json);
}

/// @nodoc
mixin _$ConversationParser {
  String get user_message => throw _privateConstructorUsedError;
  String get bot_response => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConversationParserCopyWith<ConversationParser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationParserCopyWith<$Res> {
  factory $ConversationParserCopyWith(
          ConversationParser value, $Res Function(ConversationParser) then) =
      _$ConversationParserCopyWithImpl<$Res, ConversationParser>;
  @useResult
  $Res call({String user_message, String bot_response});
}

/// @nodoc
class _$ConversationParserCopyWithImpl<$Res, $Val extends ConversationParser>
    implements $ConversationParserCopyWith<$Res> {
  _$ConversationParserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_message = null,
    Object? bot_response = null,
  }) {
    return _then(_value.copyWith(
      user_message: null == user_message
          ? _value.user_message
          : user_message // ignore: cast_nullable_to_non_nullable
              as String,
      bot_response: null == bot_response
          ? _value.bot_response
          : bot_response // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConversationParserImplCopyWith<$Res>
    implements $ConversationParserCopyWith<$Res> {
  factory _$$ConversationParserImplCopyWith(_$ConversationParserImpl value,
          $Res Function(_$ConversationParserImpl) then) =
      __$$ConversationParserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String user_message, String bot_response});
}

/// @nodoc
class __$$ConversationParserImplCopyWithImpl<$Res>
    extends _$ConversationParserCopyWithImpl<$Res, _$ConversationParserImpl>
    implements _$$ConversationParserImplCopyWith<$Res> {
  __$$ConversationParserImplCopyWithImpl(_$ConversationParserImpl _value,
      $Res Function(_$ConversationParserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_message = null,
    Object? bot_response = null,
  }) {
    return _then(_$ConversationParserImpl(
      user_message: null == user_message
          ? _value.user_message
          : user_message // ignore: cast_nullable_to_non_nullable
              as String,
      bot_response: null == bot_response
          ? _value.bot_response
          : bot_response // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversationParserImpl implements _ConversationParser {
  _$ConversationParserImpl(
      {required this.user_message, required this.bot_response});

  factory _$ConversationParserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversationParserImplFromJson(json);

  @override
  final String user_message;
  @override
  final String bot_response;

  @override
  String toString() {
    return 'ConversationParser(user_message: $user_message, bot_response: $bot_response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationParserImpl &&
            (identical(other.user_message, user_message) ||
                other.user_message == user_message) &&
            (identical(other.bot_response, bot_response) ||
                other.bot_response == bot_response));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user_message, bot_response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationParserImplCopyWith<_$ConversationParserImpl> get copyWith =>
      __$$ConversationParserImplCopyWithImpl<_$ConversationParserImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversationParserImplToJson(
      this,
    );
  }
}

abstract class _ConversationParser implements ConversationParser {
  factory _ConversationParser(
      {required final String user_message,
      required final String bot_response}) = _$ConversationParserImpl;

  factory _ConversationParser.fromJson(Map<String, dynamic> json) =
      _$ConversationParserImpl.fromJson;

  @override
  String get user_message;
  @override
  String get bot_response;
  @override
  @JsonKey(ignore: true)
  _$$ConversationParserImplCopyWith<_$ConversationParserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
