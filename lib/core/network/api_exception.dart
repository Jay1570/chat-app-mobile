import "package:mobile_app/models/api_response.dart";

class ApiException implements Exception {
  const ApiException(this.response);

  final ApiResponse response;

  @override
  String toString() => response.message;
}
