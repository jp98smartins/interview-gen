import 'package:flutter/material.dart';
import 'package:marvel/app/core/theme/app_colors.dart';

final class LoadingComponent extends StatelessWidget {
  const LoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        key: Key('ListMoviesPage#LoadingBody'),
        backgroundColor: AppColors.secondary,
      ),
    );
  }
}
