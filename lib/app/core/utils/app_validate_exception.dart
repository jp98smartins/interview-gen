import 'dart:developer';

import 'package:marvel/app/core/exceptions/app_exception.dart';
import 'package:marvel/app/core/exceptions/datasource_exception.dart';
import 'package:marvel/app/core/exceptions/mapper_exception.dart';
import 'package:micro_core_result/micro_core_result.dart';

/// This class is used to validate the basic exceptions that can occur.
sealed class AppValidateException {
  static Future<Result<AppException, T>> validate<T>(
    Future<T> Function() validate,
  ) async {
    try {
      final result = await validate();
      return Right(result);
    } on MapperException catch (exception, stackTrace) {
      log(
        '[ AppValidateException ] MapperException | $exception\n$stackTrace',
      );
      // Should log to a Error Tracking Platform (Crashlytics, Sentry, etc.)
      return Left(exception);
    } on DatasourceException catch (exception, stackTrace) {
      log(
        '[ AppValidateException ] DatasourceException | $exception\n$stackTrace',
      );
      return Left(exception);
    }
  }
}
