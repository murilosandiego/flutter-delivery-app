class ServerException implements Exception {
  final String message;

  ServerException([this.message]);

  String toString() {
    if (message == null) return "Exception";
    return "Exception: $message";
  }
}
