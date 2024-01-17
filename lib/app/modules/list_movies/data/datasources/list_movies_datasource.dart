import '../../domain/entities/movies_list_entity.dart';
import '../../domain/mocks/list_movies_mock.dart';
import '../mappers/movies_list_mapper.dart';
import 'interfaces/list_movies_datasource_interface.dart';

final class ListMoviesDatasource implements IListMoviesDatasource {
  // final IHttpClient client;

  // const ListMoviesDatasource({required this.client});
  const ListMoviesDatasource();

  @override
  Future<MoviesListEntity> call() async {
    // // 1 - Cenário Real
    // try {
    //   final response = client.get('/movies');

    //   if (response?.statusCode != 200) {
    //     throw DatasourceException(
    //       'message',
    //       response?.statusCode,
    //       stackTrace: stackTrace,
    //       step: 'List Movies',
    //     );
    //   }

    //   final moviesList = MoviesListMapper.fromMap(
    //     Map<String, dynamic>.from(response?.data as Map),
    //   );
    //   return moviesList;
    // } on HttpException catch (exception, stackTrace) {
    //   throw DatasourceException(
    //     exception.message,
    //     exception.statusCode,
    //     stackTrace: stackTrace,
    //     step: 'List Movies',
    //   );
    // }

    // // 2 - Cenário de Sucesso (Lista Vazia)
    // return MoviesListMapper.fromMap(
    //   ListMoviesMock.emptyList,
    // );

    // 3 - Cenário de Sucesso (Lista Preenchida)
    return MoviesListMapper.fromMap(
      ListMoviesMock.filledList,
    );

    // // 4 - Cenário de Exceção (DatasourceException)
    // throw ListMoviesMock.throwDatasourceException;

    // // 5 - Cenário de Exceção (MapperException)
    // throw ListMoviesMock.throwMapperException;
  }
}
