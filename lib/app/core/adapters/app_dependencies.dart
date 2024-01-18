import 'package:get_it/get_it.dart';
import 'package:marvel/app/modules/list_movies/data/datasources/interfaces/list_movies_datasource_interface.dart';
import 'package:marvel/app/modules/list_movies/data/datasources/list_movies_datasource.dart';
import 'package:marvel/app/modules/list_movies/data/repositories/list_movies_repository.dart';
import 'package:marvel/app/modules/list_movies/domain/repositories/list_movies_repository_interface.dart';
import 'package:marvel/app/modules/list_movies/domain/usecases/interfaces/list_movies_usecase_interface.dart';
import 'package:marvel/app/modules/list_movies/domain/usecases/list_movies_usecase.dart';
import 'package:marvel/app/modules/list_movies/presenters/store/list_movies_store.dart';

/// This class is a wrapper to handle the dependency injection.
///
/// This is a wrapper of [`get_it`](https://pub.dev/packages/get_it) library.
final class AppDependencies {
  static final _i = GetIt.instance;

  static T get<T extends Object>([String? name]) {
    return _i.get<T>(instanceName: name);
  }

  const AppDependencies._();

  static void inject() {
    // List Movies
    _i.registerLazySingleton<IListMoviesDatasource>(
      () => const ListMoviesDatasource(),
    );
    _i.registerLazySingleton<IListMoviesRepository>(
      () => ListMoviesRepository(_i.get<IListMoviesDatasource>()),
    );
    _i.registerLazySingleton<IListMoviesUsecase>(
      () => ListMoviesUsecase(_i.get<IListMoviesRepository>()),
    );
    _i.registerLazySingleton<ListMoviesStore>(
      () => ListMoviesStore(_i.get<IListMoviesUsecase>()),
    );
  }
}
