import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/core/extensions/key_entension.dart';

void main() {
  group(
    'value |',
    () {
      test(
        'Success | Should return a String with the value of the key',
        () {
          // Arrange
          const expected = 'Component';
          const key = Key(expected);

          // Act
          final result = key.value;

          // Assert
          expect(result, equals(expected));
        },
      );
      
      test(
        'Failure | Should return an empty String when key is null',
        () {
          // Arrange
          const expected = '';
          Key? key;

          // Act
          final result = key.value;

          // Assert
          expect(result, equals(expected));
        },
      );
    },
  );
}
