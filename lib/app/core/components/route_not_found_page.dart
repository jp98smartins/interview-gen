import 'package:flutter/material.dart';
import 'package:marvel/app/core/theme/app_colors.dart';

final class RouteNotFoundPage extends StatelessWidget {
  final String route;

  const RouteNotFoundPage({
    super.key,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('RouteNotFoundPage'),
      appBar: AppBar(
        key: const Key('RouteNotFoundPage#AppBar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              Icons.warning_amber_rounded,
              color: AppColors.error,
              size: 36,
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: Text('Rota: [ $route ] não encontrada!'),
          ),
        ],
      ),
    );
  }
}
