// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityDetailModelImpl _$$CommunityDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CommunityDetailModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$CommunityDetailModelImplToJson(
        _$CommunityDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
