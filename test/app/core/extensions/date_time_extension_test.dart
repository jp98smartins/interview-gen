import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/core/extensions/date_time_extension.dart';

void main() {
  group(
    'toStringDate() |',
    () {
      test(
        'Should return a String of the DateTime on the "dd/MM/yyyy" format',
        () {
          // Arrange
          const expected = '25/08/1998';
          final dateTime = DateTime(1998, 08, 25);

          // Act
          final result = dateTime.toStringDate();

          // Assert
          expect(result, equals(expected));
        },
      );
    },
  );
}
