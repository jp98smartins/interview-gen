import 'package:flutter/material.dart';
import 'package:marvel/app/core/adapters/app_svg.dart';
import 'package:marvel/app/core/theme/app_icons.dart';

final class MoviesList extends StatelessWidget {
  const MoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppSvg.asset(AppIcons.logo),
      ),
    );
  }
}
