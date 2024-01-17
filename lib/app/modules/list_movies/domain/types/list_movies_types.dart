import 'package:marvel/app/core/exceptions/app_exception.dart';
import 'package:micro_core_result/micro_core_result.dart';

import '../entities/movies_list_entity.dart';

typedef ListMoviesResult = Result<AppException, MoviesListEntity>;
