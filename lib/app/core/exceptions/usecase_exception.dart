import 'package:marvel/app/core/exceptions/app_exception.dart';

/// This class represents all the exceptions that were thrown when applying a
/// business rule.
final class UsecaseException extends AppException {
  const UsecaseException(
    super.message, {
    super.stackTrace,
    super.step,
  });
}
