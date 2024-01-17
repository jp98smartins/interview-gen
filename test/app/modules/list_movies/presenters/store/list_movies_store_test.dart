import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/modules/list_movies/data/mappers/movies_list_mapper.dart';
import 'package:marvel/app/modules/list_movies/domain/mocks/list_movies_mock.dart';
import 'package:marvel/app/modules/list_movies/domain/usecases/interfaces/list_movies_usecase_interface.dart';
import 'package:marvel/app/modules/list_movies/presenters/states/list_movies_states.dart';
import 'package:marvel/app/modules/list_movies/presenters/store/list_movies_store.dart';
import 'package:micro_core_result/micro_core_result.dart';
import 'package:mocktail/mocktail.dart';

final class MockListMoviesUsecase extends Mock implements IListMoviesUsecase {}

void main() {
  late final IListMoviesUsecase listMoviesUsecase;

  setUpAll(
    () {
      listMoviesUsecase = MockListMoviesUsecase();
    },
  );

  group(
    'Success |',
    () {
      test(
        'Should emit the States correctly when the usecase returns a Right',
        () {
          // Arrange
          when(() => listMoviesUsecase()).thenAnswer(
            (_) async => Right(
              MoviesListMapper.fromMap(ListMoviesMock.emptyList),
            ),
          );
          final store = ListMoviesStore(listMoviesUsecase);

          // Assert
          expect(store.state, isA<InitialListMoviesState>());
          expect(
            store.stream,
            emitsInOrder([
              isA<LoadingListMoviesState>(),
              isA<SuccessListMoviesState>(),
            ]),
          );

          // Act
          store.listMovies();
        },
      );
    },
  );

  group(
    'Failure |',
    () {
      test(
        'Should emit the States correctly when the usecase returns a Left',
        () {
          // Arrange
          when(() => listMoviesUsecase()).thenAnswer(
            (_) async => Left(ListMoviesMock.throwMapperException),
          );
          final store = ListMoviesStore(listMoviesUsecase);

          // Assert
          expect(store.state, isA<InitialListMoviesState>());
          expect(
            store.stream,
            emitsInOrder([
              isA<LoadingListMoviesState>(),
              isA<ExceptionListMoviesState>(),
            ]),
          );

          // Act
          store.listMovies();
        },
      );
    },
  );
}
