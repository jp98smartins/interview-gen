import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/core/components/route_not_found_page.dart';
import 'package:marvel/app/core/theme/app_colors.dart';

void main() {
  group(
    'Widget |',
    () {
      testWidgets(
        'Failure | Should build the RouteNotFoundPage correctly when route does not exist',
        (tester) async {
          // Arrange
          const route = '/not-found';

          // Act
          await tester.pumpWidget(
            const MaterialApp(
              home: RouteNotFoundPage(route: route),
            ),
          );
          await tester.pump(const Duration(seconds: 10));

          // Assert
          final finder = find.byKey(const Key('RouteNotFoundPage'));
          expect(finder, findsOneWidget);
          final scaffold = tester.firstWidget(finder) as Scaffold;
          final appBarFinder = find.byKey(
            const Key('RouteNotFoundPage#AppBar'),
          );
          expect(appBarFinder, findsOneWidget);
          final children = (scaffold.body as Column).children;
          final iconWidget = (children[0] as Center).child as Icon;
          final spacerWidget = children[1] as SizedBox;
          final textWidget = (children[2] as Center).child as Text;
          expect(iconWidget.color, equals(AppColors.error));
          expect(iconWidget.icon, equals(Icons.warning_amber_rounded));
          expect(iconWidget.size, equals(36));
          expect(spacerWidget.height, equals(24));
          expect(spacerWidget.width, equals(null));
          expect(textWidget.data, equals('Rota: [ $route ] não encontrada!'));
        },
      );
    },
  );
}
