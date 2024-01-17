import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/core/exceptions/mapper_exception.dart';

void main() {
  group(
    'Extension |',
    () {
      test(
        'Should also be an instance of Exception',
        () {
          // Arrange
          const message = 'MapperException message';

          // Act
          const mapperException =  MapperException(message);

          // Assert
          expect(mapperException, isA<Exception>());
        },
      );
    },
  );
}
