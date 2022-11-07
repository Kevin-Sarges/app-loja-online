class ErrorMessage implements Exception {
  final String message;

  ErrorMessage(this.message);

  @override
  String toString() => 'AuthException(message: $message)';
}
