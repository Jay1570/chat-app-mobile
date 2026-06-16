import "package:dio/dio.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:chathub/core/network/api_exception.dart";
import "package:chathub/core/network/dio_provider.dart";
import "package:chathub/models/api_response.dart";

class ApiClient {
  ApiClient(this._dio);

  final Dio _dio;

  Future<T> get<T>(String path, T Function(Object? json) fromJson) async {
    final response = await _dio.get<Map<dynamic, dynamic>>(path);
    final apiResponse = ApiResponse<T>.fromJson(
      Map<String, dynamic>.from(response.data ?? {}),
      fromJson,
    );

    if (!apiResponse.success) {
      throw ApiException(apiResponse);
    }

    return apiResponse.data as T;
  }

  Future<T> post<T>(
    String path, {
    Object? data,
    required T Function(Object? json) fromJson,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(path, data: data);

    final apiResponse = ApiResponse<T>.fromJson(response.data!, fromJson);

    if (!apiResponse.success) {
      throw ApiException(apiResponse);
    }

    return apiResponse.data as T;
  }
}

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref.watch(dioProvider));
});
