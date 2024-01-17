import 'package:marvel/app/core/exceptions/app_exception.dart';

/// This class represents all the exceptions that were thrown by a HTTP client.
final class DatasourceException extends AppException {
  /// The status code of the HTTP exception
  final int statusCode;

  const DatasourceException(
    super.message, 
    this.statusCode, {
    super.stackTrace,
    super.step,
  });
}
