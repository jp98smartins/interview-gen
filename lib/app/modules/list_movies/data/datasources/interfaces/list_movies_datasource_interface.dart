import '../../../domain/entities/movies_list_entity.dart';

abstract interface class IListMoviesDatasource {
  Future<MoviesListEntity> call();
}
