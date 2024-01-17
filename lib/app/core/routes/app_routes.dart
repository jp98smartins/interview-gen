import 'package:flutter/material.dart';
import 'package:marvel/app/modules/movies_list.dart';

/// This class has all the available routes on the app.
///
/// Be sure to add a new route on the [routes] variable too, when creating a new
/// route.
///
/// e.g.:
///
/// ```dart
///   // Creating new route
///   static const newRoute = 'newRoute';
///
///   static final routes = {
///     ...,
///     // Adding new route to the app
///     newRoute: (BuildContext context) => NewScreen(),
///     ...,
///   }
/// ```
sealed class AppRoutes {
  static const moviesList = '/movies-list';

  static final routes = {
    moviesList: (BuildContext context) => const MoviesList(),
  };
}
