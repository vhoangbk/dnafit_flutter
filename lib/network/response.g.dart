// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      json['message'] as String,
      json['responseCode'] as String,
      json['ok'] as bool,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'message': instance.message,
      'responseCode': instance.responseCode,
      'ok': instance.ok,
    };

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      json['refNo'] as String,
      Result.fromJson(json['result'] as Map<String, dynamic>),
      json['data'],
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'refNo': instance.refNo,
      'result': instance.result.toJson(),
      'data': instance.data,
    };
