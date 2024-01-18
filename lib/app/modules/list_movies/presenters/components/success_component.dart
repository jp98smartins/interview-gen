import 'package:flutter/material.dart';
import 'package:marvel/app/modules/list_movies/domain/entities/movies_list_entity.dart';
import 'package:marvel/app/modules/list_movies/presenters/components/movie_card_component.dart';

final class SuccessComponent extends StatelessWidget {
  final MoviesListEntity moviesList;

  const SuccessComponent({
    super.key,
    required this.moviesList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const Key('ListMoviesPage#SuccessBody'),
      padding: const EdgeInsets.only(bottom: 24),
      itemCount: moviesList.movies.length,
      itemBuilder: (context, index) {
        final movie = moviesList.movies[index];

        return MovieCardComponent(
          movie: movie,
          key: Key("MovieCardComponent#${movie.id}"),
        );
      },
    );
  }
}
