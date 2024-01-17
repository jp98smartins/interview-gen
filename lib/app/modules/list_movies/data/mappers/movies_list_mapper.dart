import 'package:marvel/app/core/utils/app_mapper.dart';

import '../../domain/entities/movies_list_entity.dart';
import 'movie_mapper.dart';

sealed class MoviesListMapper {
  static MoviesListEntity fromMap(Map<String, dynamic> map) {
    return MoviesListEntity(
      movies: AppMapper.parse(
        'mcu',
        () => List<Map<String, dynamic>>.from(map['mcu'] as List)
            .map(MovieMapper.fromMap)
            .toList(),
      ),
    );
  }
}
