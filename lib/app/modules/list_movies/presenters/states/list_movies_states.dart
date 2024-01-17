import 'package:marvel/app/core/exceptions/app_exception.dart';

import '../../domain/entities/movies_list_entity.dart';

sealed class ListMoviesStates {}

final class ExceptionListMoviesState extends ListMoviesStates {
  final AppException exception;

  ExceptionListMoviesState(this.exception);
}

final class InitialListMoviesState extends ListMoviesStates {}

final class LoadingListMoviesState extends ListMoviesStates {}

final class SuccessListMoviesState extends ListMoviesStates {
  final MoviesListEntity moviesListEntity;

  SuccessListMoviesState(this.moviesListEntity);
}
