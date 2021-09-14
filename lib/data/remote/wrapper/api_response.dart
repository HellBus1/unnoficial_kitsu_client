import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';
import 'model_factory.dart';

part "api_response.g.dart";

@JsonSerializable()
class ApiResponse<T> extends BaseResponse {
  @JsonKey(name: "result")
  @_Converter()
  final T? result;

  ApiResponse({
    required int status,
    required String message,
    required String domain,
    this.result,
  }) : super(status: status, message: message, domain: domain);

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return ApiResponse<T>(
        status: json["status"] as int,
        message: json["message"] as String,
        domain: json["domain"] as String,
        result: _Converter<T?>().fromJson(json["result"]));
  }
}

@JsonSerializable()
class ApiResponses<T> extends BaseResponse {
  @JsonKey(name: "data")
  @_Converter()
  List<T>? data;

  ApiResponses({
    required int status,
    required String message,
    required String domain,
    this.data = const [],
  }) : super(status: status, message: message, domain: domain);

  factory ApiResponses.fromJson(Map<String, dynamic> json) => ApiResponses<T>(
      status: json["status"] ?? 0,
      message: json["message"] ?? "",
      domain: json["domain"] ?? "",
      data:
          List<T>.from(json["data"].map((x) => _Converter<T?>().fromJson(x))));
}

class _Converter<T> implements JsonConverter<T?, Object?> {
  const _Converter();

  @override
  T? fromJson(Object? json) {
    if (json is Map<String, dynamic>) {
      return ModelFactory.fromJson(T, json) as T;
    }
    return json as T;
  }

  @override
  Object toJson(T? object) {
    return (object as Object);
  }
}
