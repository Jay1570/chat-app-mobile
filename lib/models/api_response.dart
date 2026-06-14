import "package:json_annotation/json_annotation.dart";

part "api_response.g.dart";

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  const ApiResponse({
    required this.statusCode,
    required this.message,
    required this.success,
    this.data,
    this.error,
  });

  final int statusCode;
  final String message;
  final bool success;
  final T? data;
  final dynamic error;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);
}
