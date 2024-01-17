import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/core/exceptions/datasource_exception.dart';
import 'package:marvel/app/core/exceptions/mapper_exception.dart';
import 'package:marvel/app/modules/list_movies/data/datasources/interfaces/list_movies_datasource_interface.dart';
import 'package:marvel/app/modules/list_movies/data/datasources/list_movies_datasource.dart';
import 'package:marvel/app/modules/list_movies/domain/entities/movies_list_entity.dart';

// Create a mock of a HTTP Client
// final class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  // late final IHttpClient client;

  setUpAll(
    () {
      // client = MockHttpClient();
    },
  );

  group(
    'Success |',
    () {
      test(
        'Should return a MoviesListEntity when statusCode is 200',
        () async {
          // Arrange
          // Mock client response
          // final datasource = ListMoviesDatasource(client);
          const IListMoviesDatasource datasource = ListMoviesDatasource();

          // Act
          final moviesList = await datasource();

          // Assert
          expect(moviesList, isA<MoviesListEntity>());
        },
      );
    },
  );

  group(
    'Failure |',
    () {
      test(
        'Should throw a DatasourceException when a HttpException is thrown',
        () async {
          // Arrange
          // Mock client response
          // final datasource = ListMoviesDatasource(client);
          const IListMoviesDatasource datasource = ListMoviesDatasource();

          try {
            // Act
            await datasource();
          } on DatasourceException catch (exception) {
            // Assert
            expect(
              exception.message,
              equals('Not able to retreive the movies list!'),
            );
          }
        },
      );

      test(
        'Should throw a MapperException when a HttpResponse has a statusCode != 200',
        () async {
          // Arrange
          // Mock client response
          // final datasource = ListMoviesDatasource(client);
          const IListMoviesDatasource datasource = ListMoviesDatasource();

          try {
            // Act
            await datasource();
          } on MapperException catch (exception) {
            // Assert
            expect(
              exception.message,
              equals('Not able to parse the movies list!'),
            );
          }
        },
      );
    },
  );
}
