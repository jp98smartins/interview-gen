import 'package:flutter/material.dart';
import 'package:marvel/app/core/routes/app_routes.dart';
import 'package:marvel/app/core/theme/app_theme.dart';

void main() {
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
      title: 'Marvel Studios',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.moviesList,
      routes: AppRoutes.routes,
    );
  }
}
