import 'package:chathub/core/network/api_exception.dart';
import 'package:dio/dio.dart';

class ErrorInfo {
  const ErrorInfo({
    required this.title,
    required this.message,
  });

  final String title;
  final String message;
}

ErrorInfo resolveError(Object error) {
  if (error is ApiException) {
    return ErrorInfo(
      title: error.title,
      message: error.message,
    );
  }

  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ErrorInfo(
          title: "Request Timed Out",
          message: "Please try again later.",
        );

      case DioExceptionType.connectionError:
        return const ErrorInfo(
          title: "No Internet Connection",
          message: "Please check your internet connection.",
        );

      default:
        return const ErrorInfo(
          title: "Network Error",
          message: "Something went wrong.",
        );
    }
  }

  return const ErrorInfo(
    title: "Unexpected Error",
    message: "Something went wrong.",
  );
}
