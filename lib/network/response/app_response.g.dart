// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppResponse _$AppResponseFromJson(Map<String, dynamic> json) => AppResponse(
      message: json['message'] as String?,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AppResponseToJson(AppResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
