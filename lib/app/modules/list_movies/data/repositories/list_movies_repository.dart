import 'package:marvel/app/core/utils/app_validate_exception.dart';

import '../../domain/entities/movies_list_entity.dart';
import '../../domain/repositories/list_movies_repository_interface.dart';
import '../../domain/types/list_movies_types.dart';
import '../datasources/interfaces/list_movies_datasource_interface.dart';

final class ListMoviesRepository implements IListMoviesRepository {
  final IListMoviesDatasource datasource;

  const ListMoviesRepository(this.datasource);

  @override
  Future<ListMoviesResult> call() async {
    final result = await AppValidateException.validate<MoviesListEntity>(
      datasource,
    );
    return result;
  }
}
