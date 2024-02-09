class DataException implements Exception {
  final int statusCode;
  final String message;
  final dynamic errorData;

  DataException(this.statusCode, this.message, {this.errorData});

  @override
  String toString() => 'DataException: $message (Status code: $statusCode)';
}
