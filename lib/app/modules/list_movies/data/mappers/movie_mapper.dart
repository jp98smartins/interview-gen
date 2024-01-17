import 'package:marvel/app/core/utils/app_mapper.dart';

import '../../domain/entities/movie_entity.dart';

sealed class MovieMapper {
  static MovieEntity fromMap(Map<String, dynamic> map) {
    return MovieEntity(
      id: AppMapper.parse(
        'id',
        () => map['id'] as int,
      ),
      originalTitle: AppMapper.parse(
        'original_title',
        () => map['original_title'] as String,
      ),
      overview: AppMapper.parse(
        'overview',
        () => map['overview'] as String,
      ),
      poster: AppMapper.parse(
        'poster_path',
        () => map['poster_path'] as String,
      ),
      releaseDate: AppMapper.parse(
        'release_date',
        () => DateTime.parse(map['release_date']),
      ),
      title: AppMapper.parse(
        'title',
        () => map['title'] as String,
      ),
      voteAverage: AppMapper.parse(
        'vote_average',
        () => map['vote_average'] as double,
      ),
    );
  }
}
