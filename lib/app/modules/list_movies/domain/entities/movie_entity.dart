final class MovieEntity {
  final List<String> genres;
  final int id;
  final String originalTitle;
  final String overview;
  final String poster;
  final DateTime releaseDate;
  final String title;
  final double voteAverage;

  const MovieEntity({
    required this.genres,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.poster,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });
}
