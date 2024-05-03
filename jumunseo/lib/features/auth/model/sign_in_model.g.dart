// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignInModelImpl _$$SignInModelImplFromJson(Map<String, dynamic> json) =>
    _$SignInModelImpl(
      email: json['email'] as String?,
      password: json['password'] as String?,
      timestamp: json['timestamp'] as String?,
      status: json['status'] as String?,
      error: json['error'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$$SignInModelImplToJson(_$SignInModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'timestamp': instance.timestamp,
      'status': instance.status,
      'error': instance.error,
      'path': instance.path,
    };
