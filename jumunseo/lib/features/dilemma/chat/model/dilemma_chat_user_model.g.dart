// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dilemma_chat_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DilemmaChatUserModelImpl _$$DilemmaChatUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DilemmaChatUserModelImpl(
      userId: json['userId'] as String,
      userNickname: json['userNickname'] as String,
      profileImage: json['profileImage'] as String?,
    );

Map<String, dynamic> _$$DilemmaChatUserModelImplToJson(
        _$DilemmaChatUserModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userNickname': instance.userNickname,
      'profileImage': instance.profileImage,
    };
