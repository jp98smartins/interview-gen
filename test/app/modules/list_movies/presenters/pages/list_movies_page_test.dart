import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/modules/list_movies/data/mappers/movies_list_mapper.dart';
import 'package:marvel/app/modules/list_movies/domain/mocks/list_movies_mock.dart';
import 'package:marvel/app/modules/list_movies/domain/usecases/interfaces/list_movies_usecase_interface.dart';
import 'package:marvel/app/modules/list_movies/presenters/pages/list_movies_page.dart';
import 'package:marvel/app/modules/list_movies/presenters/states/list_movies_states.dart';
import 'package:marvel/app/modules/list_movies/presenters/store/list_movies_store.dart';
import 'package:micro_core_result/micro_core_result.dart';
import 'package:mocktail/mocktail.dart';

final class MockListMoviesUsecase extends Mock implements IListMoviesUsecase {}

void main() {
  const pageKey = Key('ListMoviesPage');
  const appBarKey = Key('ListMoviesPage#AppBar');
  const appBarTitleKey = Key('ListMoviesPage#AppBar#Title');
  const loadingBodyKey = Key('ListMoviesPage#LoadingBody');
  const exceptionBodyKey = Key('ListMoviesPage#ExceptionBody');
  const successBodyKey = Key('ListMoviesPage#SuccessBody');

  group(
    'initState() |',
    () {
      late final IListMoviesUsecase usecase;

      setUpAll(() {
        usecase = MockListMoviesUsecase();
      });

      testWidgets(
        'Success | Should emit the States correctly when the usecase returns a Right',
        (tester) async {
          // Arrange
          when(() => usecase()).thenAnswer(
            (_) async => Right(
              MoviesListMapper.fromMap(ListMoviesMock.filledList),
            ),
          );
          final store = ListMoviesStore(usecase);

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
          await tester.pumpWidget(
            MaterialApp(
              home: ListMoviesPage(listMoviesStore: store),
            ),
          );
        },
      );
    },
  );

  group(
    'Widgets |',
    () {
      late final IListMoviesUsecase usecase;

      setUpAll(() {
        usecase = MockListMoviesUsecase();
      });

      testWidgets(
        'Should find the Widgets correctly while the usecase is getting the result',
        (tester) async {
          // Arrange
          when(() => usecase()).thenAnswer(
            (_) async {
              await Future.delayed(const Duration(milliseconds: 100));
              return Right(
                MoviesListMapper.fromMap(ListMoviesMock.filledList),
              );
            },
          );
          final store = ListMoviesStore(usecase);

          // Act
          await tester.pumpWidget(
            MaterialApp(
              home: ListMoviesPage(listMoviesStore: store),
            ),
          );

          // Assert
          expect(store.state, isA<LoadingListMoviesState>());
          expect(find.byKey(pageKey), findsOneWidget);
          expect(find.byKey(appBarKey), findsOneWidget);
          expect(find.byKey(appBarTitleKey), findsOneWidget);
          expect(find.byKey(loadingBodyKey), findsOneWidget);

          // Act
          await tester.pumpAndSettle(const Duration(seconds: 10));
        },
      );

      testWidgets(
        'Should find the Widgets correctly when the usecase returns a Right',
        (tester) async {
          // Arrange
          when(() => usecase()).thenAnswer(
            (_) async => Right(
              MoviesListMapper.fromMap(ListMoviesMock.filledList),
            ),
          );
          final store = ListMoviesStore(usecase);

          // Act
          await tester.pumpWidget(
            MaterialApp(
              home: ListMoviesPage(listMoviesStore: store),
            ),
          );
          await tester.pumpAndSettle(const Duration(seconds: 10));

          // Assert
          expect(store.state, isA<SuccessListMoviesState>());
          expect(find.byKey(pageKey), findsOneWidget);
          expect(find.byKey(appBarKey), findsOneWidget);
          expect(find.byKey(appBarTitleKey), findsOneWidget);
          expect(find.byKey(successBodyKey), findsOneWidget);
        },
      );

      testWidgets(
        'Should find the Widgets correctly when the usecase returns a Left',
        (tester) async {
          // Arrange
          when(() => usecase()).thenAnswer(
            (_) async => Left(ListMoviesMock.throwMapperException),
          );
          final store = ListMoviesStore(usecase);

          // Act
          await tester.pumpWidget(
            MaterialApp(
              home: ListMoviesPage(listMoviesStore: store),
            ),
          );
          await tester.pumpAndSettle(const Duration(seconds: 10));

          // Assert
          expect(store.state, isA<ExceptionListMoviesState>());
          expect(find.byKey(pageKey), findsOneWidget);
          expect(find.byKey(appBarKey), findsOneWidget);
          expect(find.byKey(appBarTitleKey), findsOneWidget);
          expect(find.byKey(exceptionBodyKey), findsOneWidget);
        },
      );
    },
  );
}
