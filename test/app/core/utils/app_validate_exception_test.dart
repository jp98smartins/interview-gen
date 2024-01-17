import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/core/exceptions/datasource_exception.dart';
import 'package:marvel/app/core/exceptions/mapper_exception.dart';
import 'package:marvel/app/core/utils/app_validate_exception.dart';

void main() {
  group(
    'Success |',
    () {
      test(
        'Should return a Right value',
        () async {
          // Arrange
          const height = 1.84;
          const weight = 98.7;
          const data = {'height': height, 'weight': weight};
          Future<double> validate() async {
            return (data['height'] as double) * (data['weight'] as double);
          }

          // Act
          final result = await AppValidateException.validate(validate);

          // Assert
          expect(result.isRight, isTrue);
        },
      );
    },
  );

  group(
    'Failure |',
    () {
      test(
        'Should return a Left value when a DatasourceException is thrown',
        () async {
          // Arrange
          Future<double> validate() async {
            throw const DatasourceException('message', 400);
          }

          // Act
          final result = await AppValidateException.validate(validate);

          // Assert
          expect(result.isLeft, isTrue);
        },
      );

      test(
        'Should return a Left value when a MapperException is thrown',
        () async {
          // Arrange
          Future<double> validate() async {
            throw const MapperException('message');
          }

          // Act
          final result = await AppValidateException.validate(validate);

          // Assert
          expect(result.isLeft, isTrue);
        },
      );
    },
  );
}
