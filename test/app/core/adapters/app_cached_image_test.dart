import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/core/adapters/app_cached_image.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  group(
    'url() |',
    () {
      testWidgets(
        'Success | Should render a image from a url',
        (tester) async {
          await mockNetworkImagesFor(
            () async {
              // Arrange
              const height = 300.0;
              const width = 200.0;
              const path =
                  'https://image.tmdb.org/t/p/original/xYijVAPunk6neVW2KHKE4Lp45ZU.jpg';

              // Act
              await tester.pumpWidget(
                MaterialApp(
                  home: Scaffold(
                    body: AppCacheImage.url(
                      path,
                      height: height,
                      width: width,
                    ),
                  ),
                ),
              );
              await tester.pump(const Duration(seconds: 10));

              // Assert
              final finder = find.byType(CachedNetworkImage);
              expect(finder, findsOneWidget);

              // Act
              await tester.pump(const Duration(seconds: 10));
            },
          );
        },
      );
    },
  );
}
