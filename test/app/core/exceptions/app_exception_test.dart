import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/core/exceptions/app_exception.dart';

void main() {
  group(
    'Extension |',
    () {
      test(
        'Should also be an instance of Exception',
        () {
          // Arrange
          const message = 'AppException message';

          // Act
          const appException =  AppException(message);

          // Assert
          expect(appException, isA<Exception>());
        },
      );
    },
  );
}
