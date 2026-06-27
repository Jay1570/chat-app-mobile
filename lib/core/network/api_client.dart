import "package:dio/dio.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:chathub/core/network/api_exception.dart";
import "package:chathub/core/network/dio_provider.dart";
import "package:chathub/models/api_response.dart";

class ApiClient {
  ApiClient(this._dio);

  final Dio _dio;

  Future<T> get<T>(
    String path, {
    T Function(Object? json)? fromJson,
    Map<String, dynamic>? queryParameters,
  }) => _request(
    () =>
        _dio.get<Map<String, dynamic>>(path, queryParameters: queryParameters),
    fromJson: fromJson,
  );

  Future<T> post<T>(
    String path, {
    Object? data,
    T Function(Object? json)? fromJson,
    Map<String, dynamic>? queryParameters,
  }) => _request(
    () => _dio.post<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
    ),
    fromJson: fromJson,
  );

  Future<T> put<T>(
    String path, {
    Object? data,
    T Function(Object? json)? fromJson,
    Map<String, dynamic>? queryParameters,
  }) => _request(
    () => _dio.put<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
    ),
    fromJson: fromJson,
  );

  Future<T> patch<T>(
    String path, {
    Object? data,
    T Function(Object? json)? fromJson,
    Map<String, dynamic>? queryParameters,
  }) => _request(
    () => _dio.patch<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
    ),
    fromJson: fromJson,
  );

  Future<T> delete<T>(
    String path, {
    Object? data,
    T Function(Object? json)? fromJson,
    Map<String, dynamic>? queryParameters,
  }) => _request(
    () => _dio.delete<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
    ),
    fromJson: fromJson,
  );

  Future<T> _request<T>(
    Future<Response<Map<String, dynamic>>> Function() call, {
    T Function(Object? json)? fromJson,
  }) async {
    final response = await call();
    final apiResponse = ApiResponse<T>.fromJson(
      Map<String, dynamic>.from(response.data ?? {}),
      fromJson ?? (_) => null as T,
    );

    if (!apiResponse.success) {
      throw ApiException(apiResponse);
    }

    return apiResponse.data as T;
  }
}

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref.watch(dioProvider));
});
