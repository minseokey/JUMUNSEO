// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityDetailModelImpl _$$CommunityDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CommunityDetailModelImpl(
      content: json['content'] as String,
      id: json['id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      type: json['type'] as String,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$CommunityDetailModelImplToJson(
        _$CommunityDetailModelImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'description': instance.description,
      'image': instance.image,
      'type': instance.type,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at?.toIso8601String(),
    };
