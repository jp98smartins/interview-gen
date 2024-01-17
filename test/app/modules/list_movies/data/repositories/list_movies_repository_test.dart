import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/modules/list_movies/data/datasources/interfaces/list_movies_datasource_interface.dart';
import 'package:marvel/app/modules/list_movies/data/mappers/movies_list_mapper.dart';
import 'package:marvel/app/modules/list_movies/data/repositories/list_movies_repository.dart';
import 'package:marvel/app/modules/list_movies/domain/mocks/list_movies_mock.dart';
import 'package:mocktail/mocktail.dart';

final class MockListMoviesDatasource extends Mock
    implements IListMoviesDatasource {}

void main() {
  late final MockListMoviesDatasource datasource;

  setUpAll(
    () {
      datasource = MockListMoviesDatasource();
    },
  );

  group(
    'Success |',
    () {
      test(
        'Should return a Right when datasource returns a MoviesListEntity',
        () async {
          // Arrange
          when(() => datasource()).thenAnswer(
            (_) async => MoviesListMapper.fromMap(ListMoviesMock.emptyList),
          );
          final respository = ListMoviesRepository(datasource);

          // Act
          final result = await respository();

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
        'Should return a Left when datasource throws a DatasourceException',
        () async {
          // Arrange
          when(() => datasource()).thenThrow(
            ListMoviesMock.throwDatasourceException,
          );
          final respository = ListMoviesRepository(datasource);

          // Act
          final result = await respository();

          // Assert
          expect(result.isLeft, isTrue);
        },
      );

      test(
        'Should return a Left when datasource throws a MapperException',
        () async {
          // Arrange
          when(() => datasource()).thenThrow(
            ListMoviesMock.throwMapperException,
          );
          final respository = ListMoviesRepository(datasource);

          // Act
          final result = await respository();

          // Assert
          expect(result.isLeft, isTrue);
        },
      );
    },
  );
}
