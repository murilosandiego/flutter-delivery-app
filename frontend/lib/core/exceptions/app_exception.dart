class AppException implements Exception {
  final String message;

  AppException([this.message]);

  String toString() {
    if (message == null) return "Exception";
    return "Exception: $message";
  }
}
