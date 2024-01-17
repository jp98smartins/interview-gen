import 'package:marvel/app/core/exceptions/app_exception.dart';

/// This class represents all the exceptions that were thrown when parsing the
/// data of an HTTP response.
final class MapperException extends AppException {
  const MapperException(
    super.message, {
    super.stackTrace,
    super.step,
  });
}
