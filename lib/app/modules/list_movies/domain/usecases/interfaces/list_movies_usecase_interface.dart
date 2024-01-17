import '../../types/list_movies_types.dart';

abstract interface class IListMoviesUsecase {
  Future<ListMoviesResult> call();
}
