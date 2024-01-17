import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/core/exceptions/mapper_exception.dart';
import 'package:marvel/app/core/utils/app_mapper.dart';

void main() {
  group(
    'Success |',
    () {
      test(
        'Should parse all types of primitive data without errors',
        () {
          // Arrange
          const expectedName = 'João Pedro';
          const expectedAge = 25;
          const expectedHasChildren = false;
          const expectedHeight = 1.84;
          const data = {
            'name': expectedName,
            'age': expectedAge,
            'hasChildren': expectedHasChildren,
            'height': expectedHeight,
          };

          // Act
          final name = AppMapper.parse('name', () => data['name'] as String);
          final age = AppMapper.parse('age', () => data['age'] as int);
          final hasChildren =
              AppMapper.parse('hasChildren', () => data['hasChildren'] as bool);
          final height =
              AppMapper.parse('height', () => data['height'] as double);

          // Assert
          expect(name, equals(expectedName));
          expect(age, equals(expectedAge));
          expect(hasChildren, equals(expectedHasChildren));
          expect(height, equals(expectedHeight));
        },
      );
    },
  );

  group(
    'Failure |',
    () {
      test(
        'Should throw a MapperException when a FormatException occurs',
        () {
          // Arrange
          const expectedMessage = "[ MapperException ] Exception when parsing the key: name | FormatException";
          const expectedStep = 'step';
          const data = {
            'name': 'João Pedro',
          };

          try {
            // Act
            AppMapper.parse('name', () => int.parse(data['name'] as String), step: expectedStep);
          } on MapperException catch (exception) {
            // Assert
            expect(exception.message, contains(expectedMessage));
            expect(exception.step, contains(expectedStep));
          }
        },
      );

      test(
        'Should throw a MapperException when a TypeError occurs',
        () {
          // Arrange
          const expectedMessage = "[ MapperException ] Exception when parsing the key: name | type 'Null' is not a subtype of type 'String' in type cast";
          const expectedStep = 'step';
          const data = <String, dynamic>{
            'name': null,
          };

          try {
            // Act
            AppMapper.parse('name', () => int.parse(data['name'] as String), step: expectedStep);
          } on MapperException catch (exception) {
            // Assert
            expect(exception.message, contains(expectedMessage));
            expect(exception.step, contains(expectedStep));
          }
        },
      );
    },
  );
}
