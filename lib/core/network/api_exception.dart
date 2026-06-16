import "package:chathub/models/api_response.dart";

class ApiException implements Exception {
  const ApiException(this.response);

  final ApiResponse<dynamic> response;

  String get title => response.message;

  String get message => response.error is String && response.error != null
      ? response.error.toString()
      : "";

  @override
  String toString() => response.message;
}
