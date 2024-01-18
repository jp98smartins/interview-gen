import 'package:micro_core_store/micro_core_store.dart';

import '../../domain/usecases/interfaces/list_movies_usecase_interface.dart';
import '../states/list_movies_states.dart';

final class ListMoviesStore extends Store<ListMoviesStates> {
  final IListMoviesUsecase listMoviesUsecase;

  ListMoviesStore(this.listMoviesUsecase) : super(InitialListMoviesState());

  void listMovies() async {
    emit(LoadingListMoviesState());

    final result = await listMoviesUsecase();

    result(
      (exception) => emit(ExceptionListMoviesState(exception)),
      (moviesList) => emit(SuccessListMoviesState(moviesList)),
    );
  }
}
