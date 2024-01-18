import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:marvel/app/core/adapters/app_dependencies.dart';
import 'package:marvel/app/core/components/route_not_found_page.dart';
import 'package:marvel/app/core/routes/app_routes.dart';
import 'package:marvel/app/core/theme/app_theme.dart';
import 'package:marvel/app/modules/list_movies/domain/entities/movie_entity.dart';
import 'package:marvel/app/modules/list_movies/presenters/pages/list_movies_page.dart';
import 'package:marvel/app/modules/list_movies/presenters/store/list_movies_store.dart';
import 'package:marvel/app/modules/read_movie/presenters/pages/read_movie_page.dart';

void main() {
  // Injecting all the dependencies
  AppDependencies.inject();

  runApp(
    const MarvelStudios(),
  );
}

class MarvelStudios extends StatelessWidget {
  const MarvelStudios({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      locale: const Locale('pt', 'BR'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
        Locale('en', 'US'),
      ],
      initialRoute: AppRoutes.listMovies,
      onGenerateRoute: (settings) {
        return switch (settings.name) {
          AppRoutes.listMovies => MaterialPageRoute(
              builder: (context) => ListMoviesPage(
                listMoviesStore: AppDependencies.get<ListMoviesStore>(),
              ),
            ),
          AppRoutes.readMovie => MaterialPageRoute(
              builder: (context) => ReadMoviePage(
                movie: settings.arguments as MovieEntity,
              ),
            ),
          _ => MaterialPageRoute(
              builder: (context) => RouteNotFoundPage(
                route: settings.name ?? '',
              ),
            ),
        };
      },
    );
  }
}
