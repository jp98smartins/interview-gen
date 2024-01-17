import 'package:marvel/app/modules/list_movies/domain/entities/movies_list_entity.dart';
import 'package:micro_core_result/micro_core_result.dart';

import '../entities/movie_entity.dart';
import '../repositories/list_movies_repository_interface.dart';
import '../types/list_movies_types.dart';
import 'interfaces/list_movies_usecase_interface.dart';

final class ListMoviesUsecase implements IListMoviesUsecase {
  final IListMoviesRepository repository;

  const ListMoviesUsecase(this.repository);

  @override
  Future<ListMoviesResult> call() async {
    final result = await repository();

    return result(
      (exception) => Left(exception),
      (moviesList) {
        final sortedMoviesList = List<MovieEntity>.from(moviesList.movies);
        sortedMoviesList.sort(
          (a, b) => a.releaseDate.compareTo(b.releaseDate),
        );
        return Right(MoviesListEntity(movies: sortedMoviesList));
      },
    );
  }
}
