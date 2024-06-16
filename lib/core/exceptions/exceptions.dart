abstract class AppException implements Exception {}

class CustomException extends AppException {
  final String message;
  CustomException(this.message);

  @override
  String toString() => message;
}