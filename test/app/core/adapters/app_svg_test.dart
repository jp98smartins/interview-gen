import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/core/adapters/app_svg.dart';
import 'package:marvel/app/core/theme/app_icons.dart';

void main() {
  group(
    'asset() |',
    () {
      testWidgets(
        'Should render a SVG from the assets',
        (tester) async {
          // Arrange
          const key = Key('logoIcon');

          // Act
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: Center(
                  child: AppSvg.asset(
                    AppIcons.logo,
                    key: key,
                  ),
                ),
              ),
            ),
          );

          // Assert
          expect(find.byKey(key), findsOneWidget);
        },
      );
    },
  );
}
