// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      message: json['message'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      accessToken: json['access_token'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'message': instance.message,
      'name': instance.name,
      'email': instance.email,
      'access_token': instance.accessToken,
    };
