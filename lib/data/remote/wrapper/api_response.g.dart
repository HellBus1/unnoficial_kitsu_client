// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(Map<String, dynamic> json) {
  return ApiResponse<T>(
    status: json['status'] as int,
    message: json['message'] as String,
    domain: json['domain'] as String,
    result: _Converter<T?>().fromJson(json['result']),
  );
}

Map<String, dynamic> _$ApiResponseToJson<T>(ApiResponse<T> instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'domain': instance.domain,
      'result': _Converter<T?>().toJson(instance.result),
    };

ApiResponses<T> _$ApiResponsesFromJson<T>(Map<String, dynamic> json) {
  return ApiResponses<T>(
    status: json['status'] as int,
    message: json['message'] as String,
    domain: json['domain'] as String,
    data: (json['data'])?.map(_Converter<T>().fromJson).toList(),
  );
}

Map<String, dynamic> _$ApiResponsesToJson<T>(ApiResponses<T> instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'domain': instance.domain,
      'data': instance.data?.map(_Converter<T>().toJson).toList(),
    };
