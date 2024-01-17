import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/modules/list_movies/data/mappers/movies_list_mapper.dart';
import 'package:marvel/app/modules/list_movies/domain/mocks/list_movies_mock.dart';
import 'package:marvel/app/modules/list_movies/domain/repositories/list_movies_repository_interface.dart';
import 'package:marvel/app/modules/list_movies/domain/usecases/list_movies_usecase.dart';
import 'package:micro_core_result/micro_core_result.dart';
import 'package:mocktail/mocktail.dart';

final class MockListMoviesRepository extends Mock
    implements IListMoviesRepository {}

void main() {
  late final MockListMoviesRepository repository;

  setUpAll(
    () {
      repository = MockListMoviesRepository();
    },
  );

  group(
    'Success |',
    () {
      test(
        'Should return a Right when repository returns a Right',
        () async {
          // Arrange
          when(() => repository()).thenAnswer(
            (_) async => Right(
              MoviesListMapper.fromMap(ListMoviesMock.filledList),
            ),
          );
          final usecase = ListMoviesUsecase(repository);

          // Act
          final result = await usecase();

          // Assert
          expect(result.isRight, isTrue);
        },
      );

      test(
        'Should return a movies list sorted by releaseDate',
        () async {
          // Arrange
          final unsortedList = MoviesListMapper.fromMap(
            ListMoviesMock.filledList,
          );
          when(() => repository()).thenAnswer(
            (_) async => Right(unsortedList),
          );
          final usecase = ListMoviesUsecase(repository);

          // Act
          final result = await usecase();

          // Assert
          expect(result.isRight, isTrue);
          result(
            (l) => l,
            (sortedMoviesList) {
              expect(
                sortedMoviesList.movies.length,
                equals(sortedMoviesList.movies.length),
              );
              expect(
                sortedMoviesList.movies.isSorted(
                  (a, b) => a.releaseDate.compareTo(b.releaseDate),
                ),
                isTrue,
              );
            },
          );
        },
      );
    },
  );

  group(
    'Failure |',
    () {
      test(
        'Should return a Left(DatasourceException) when repository returns a Left(DatasourceException)',
        () async {
          // Arrange
          when(() => repository()).thenAnswer(
            (_) async => Left(ListMoviesMock.throwDatasourceException),
          );
          final usecase = ListMoviesUsecase(repository);

          // Act
          final result = await usecase();

          // Assert
          expect(result.isLeft, isTrue);
        },
      );

      test(
        'Should return a Left(MapperException) when repository returns a Left(MapperException)',
        () async {
          // Arrange
          when(() => repository()).thenAnswer(
            (_) async => Left(ListMoviesMock.throwMapperException),
          );
          final usecase = ListMoviesUsecase(repository);

          // Act
          final result = await usecase();

          // Assert
          expect(result.isLeft, isTrue);
        },
      );
    },
  );
}
