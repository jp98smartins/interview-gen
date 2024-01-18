import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/core/theme/app_colors.dart';
import 'package:marvel/app/modules/list_movies/domain/mocks/list_movies_mock.dart';
import 'package:marvel/app/modules/list_movies/domain/usecases/interfaces/list_movies_usecase_interface.dart';
import 'package:marvel/app/modules/list_movies/presenters/components/exception_component.dart';
import 'package:marvel/app/modules/list_movies/presenters/store/list_movies_store.dart';
import 'package:mocktail/mocktail.dart';

final class MockListMoviesUsecase extends Mock implements IListMoviesUsecase {}

void main() {
  const exceptionWidgetKey = Key('ListMoviesPage#ExceptionBody');
  const exceptionIconKey = Key('ListMoviesPage#ExceptionBody#Icon');
  const exceptionTextKey = Key('ListMoviesPage#ExceptionBody#Text');
  const exceptionTryAgainButtonKey = Key(
    'ListMoviesPage#ExceptionBody#TryAgainButton',
  );

  group(
    'Widgets |',
    () {
      late final IListMoviesUsecase usecase;

      setUpAll(() {
        usecase = MockListMoviesUsecase();
      });

      testWidgets(
        'Should find the Widgets correctly',
        (tester) async {
          // Arrange
          final exception = ListMoviesMock.throwMapperException;
          final store = ListMoviesStore(usecase);

          // Act
          await tester.pumpWidget(
            MaterialApp(
              home: ExceptionComponent(
                exception: exception,
                onTryAgain: store.listMovies,
              ),
            ),
          );

          // Assert
          expect(find.byKey(exceptionWidgetKey), findsOneWidget);
          expect(find.byKey(exceptionIconKey), findsOneWidget);
          expect(find.byKey(exceptionTextKey), findsOneWidget);
          expect(find.byKey(exceptionTryAgainButtonKey), findsOneWidget);
        },
      );

      testWidgets(
        'Icon should have the correct properties',
        (tester) async {
          // Arrange
          final exception = ListMoviesMock.throwMapperException;
          final store = ListMoviesStore(usecase);

          // Act
          await tester.pumpWidget(
            MaterialApp(
              home: ExceptionComponent(
                exception: exception,
                onTryAgain: store.listMovies,
              ),
            ),
          );

          // Assert
          expect(find.byKey(exceptionIconKey), findsOneWidget);
          final icon = (tester.firstWidget(
            find.byKey(exceptionIconKey),
          ) as Icon);
          expect(icon.color, equals(AppColors.error));
          expect(icon.icon, equals(Icons.warning_amber_rounded));
          expect(icon.size, equals(36));
        },
      );

      testWidgets(
        'Text should have the correct properties',
        (tester) async {
          // Arrange
          final exception = ListMoviesMock.throwMapperException;
          final store = ListMoviesStore(usecase);

          // Act
          await tester.pumpWidget(
            MaterialApp(
              home: ExceptionComponent(
                exception: exception,
                onTryAgain: store.listMovies,
              ),
            ),
          );

          // Assert
          expect(find.byKey(exceptionTextKey), findsOneWidget);
          final text = (tester.firstWidget(
            find.byKey(exceptionTextKey),
          ) as Text);
          expect(text.data, equals(exception.message));
        },
      );

      testWidgets(
        'Try Again Button should have the correct properties',
        (tester) async {
          // Arrange
          final exception = ListMoviesMock.throwMapperException;
          final store = ListMoviesStore(usecase);

          // Act
          await tester.pumpWidget(
            MaterialApp(
              home: ExceptionComponent(
                exception: exception,
                onTryAgain: store.listMovies,
              ),
            ),
          );

          // Assert
          expect(find.byKey(exceptionTryAgainButtonKey), findsOneWidget);
          final button = (tester.firstWidget(
            find.byKey(exceptionTryAgainButtonKey),
          ) as OutlinedButton);
          expect((button.child as Text).data, equals('Tentar novamente'));
          expect(button.onPressed, equals(store.listMovies));
          expect(button.style?.minimumSize?.resolve({})?.height, equals(48.0));
          expect(button.style?.side?.resolve({})?.width, equals(2.0));
          expect(
            button.style?.side?.resolve({})?.color,
            equals(AppColors.error),
          );
          expect(
            button.style?.foregroundColor?.resolve({}),
            equals(AppColors.onBackground),
          );
          expect(
            ((button.style?.shape?.resolve({}) as RoundedRectangleBorder)
                    .borderRadius as BorderRadius)
                .topLeft,
            equals(const Radius.circular(8.0)),
          );
          expect(
            ((button.style?.shape?.resolve({}) as RoundedRectangleBorder)
                    .borderRadius as BorderRadius)
                .topRight,
            equals(const Radius.circular(8.0)),
          );
          expect(
            ((button.style?.shape?.resolve({}) as RoundedRectangleBorder)
                    .borderRadius as BorderRadius)
                .bottomLeft,
            equals(const Radius.circular(8.0)),
          );
          expect(
            ((button.style?.shape?.resolve({}) as RoundedRectangleBorder)
                    .borderRadius as BorderRadius)
                .bottomRight,
            equals(const Radius.circular(8.0)),
          );
        },
      );
    },
  );
}
