import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/core/extensions/list_extensions.dart';

void main() {
  group(
    'items |',
    () {
      test(
        'Should return a String of all the items separated by a pipe',
        () {
          // Arrange
          const expected = 'João | Pedro | dos | Santos | Martins';
          const list = ['João', 'Pedro', 'dos', 'Santos', 'Martins'];

          // Act
          final result = list.items;

          // Assert
          expect(result, equals(expected));
        },
      );
      
      test(
        'Should return a empty String when the list is empty',
        () {
          // Arrange
          const expected = '';
          const list = <String>[];

          // Act
          final result = list.items;

          // Assert
          expect(result, equals(expected));
        },
      );
    },
  );
}
