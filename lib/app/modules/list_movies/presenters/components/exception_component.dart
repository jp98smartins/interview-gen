import 'package:flutter/material.dart';
import 'package:marvel/app/core/exceptions/app_exception.dart';
import 'package:marvel/app/core/theme/app_colors.dart';

final class ExceptionComponent extends StatelessWidget {
  final AppException exception;
  final VoidCallback onTryAgain;

  const ExceptionComponent({
    super.key,
    required this.exception,
    required this.onTryAgain,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      key: const Key('ListMoviesPage#ExceptionBody'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            key: Key('ListMoviesPage#ExceptionBody#Icon'),
            color: AppColors.error,
            size: 36,
          ),
          const SizedBox(height: 24),
          Text(
            exception.message,
            key: const Key('ListMoviesPage#ExceptionBody#Text'),
          ),
          const SizedBox(height: 24),
          OutlinedButton(
            key: const Key('ListMoviesPage#ExceptionBody#TryAgainButton'),
            onPressed: onTryAgain,
            style: const ButtonStyle().copyWith(
              minimumSize: MaterialStateProperty.resolveWith(
                (_) => const Size(48, 48),
              ),
              side: MaterialStateProperty.resolveWith(
                (_) => const BorderSide(color: AppColors.error, width: 2),
              ),
              shape: MaterialStateProperty.resolveWith(
                (_) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              foregroundColor: MaterialStateColor.resolveWith(
                (_) => AppColors.onBackground,
              ),
            ),
            child: const Text('Tentar novamente'),
          ),
        ],
      ),
    );
  }
}
