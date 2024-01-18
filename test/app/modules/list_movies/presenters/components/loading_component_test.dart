import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/core/theme/app_colors.dart';
import 'package:marvel/app/modules/list_movies/presenters/components/loading_component.dart';

void main() {
  group(
    'CircularProgressIndicator |',
    () {
      testWidgets(
        'Should find the Widgets correctly',
        (tester) async {
          // Arrange
          const loadingWidgetKey = Key('ListMoviesPage#LoadingBody');

          // Act
          await tester.pumpWidget(
            const MaterialApp(home: LoadingComponent()),
          );

          // Assert
          expect(find.byKey(loadingWidgetKey), findsOneWidget);
          final widget = (tester.firstWidget(
            find.byKey(loadingWidgetKey),
          ) as CircularProgressIndicator);
          expect(widget.backgroundColor, equals(AppColors.secondary));
        },
      );
    },
  );
}
