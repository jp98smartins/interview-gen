import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/core/exceptions/datasource_exception.dart';

void main() {
  group(
    'Extension |',
    () {
      test(
        'Should also be an instance of Exception',
        () {
          // Arrange
          const statusCode = 400;
          const message = 'DatasourceException message';

          // Act
          const datasourceException =  DatasourceException(message, statusCode);

          // Assert
          expect(datasourceException, isA<Exception>());
        },
      );
    },
  );
}
