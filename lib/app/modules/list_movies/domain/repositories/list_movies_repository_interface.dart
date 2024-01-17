import '../types/list_movies_types.dart';

abstract interface class IListMoviesRepository {
  Future<ListMoviesResult> call();
}
