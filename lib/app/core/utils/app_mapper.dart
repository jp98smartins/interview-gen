import 'package:marvel/app/core/exceptions/mapper_exception.dart';

/// This class is used to parse the data into Entities.
sealed class AppMapper {
  /// The key parameter is to make it easy to know what attribute triggered the 
  /// exception.
  static T parse<T>(
    String key,
    T Function() parser, {
    String? step,
  }) {
    try {
      return parser();
    } on FormatException catch (exception, stackTrace) {
      throw MapperException(
        '[ MapperException ] Exception when parsing the key: $key | $exception',
        stackTrace: stackTrace,
        step: step,
      );
    } on TypeError catch (exception, stackTrace) {
      throw MapperException(
        '[ MapperException ] Exception when parsing the key: $key | $exception',
        stackTrace: stackTrace,
        step: step,
      );
    }
  }
}
