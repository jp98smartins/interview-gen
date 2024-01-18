import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/core/components/movie_poster_component.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  group(
    'Widget |',
    () {
      testWidgets(
        'Success | Should render a image from network',
        (tester) async {
          await mockNetworkImagesFor(
            () async {
              // Arrange
              const height = 300.0;
              const width = 200.0;
              const path =
                  'https://image.tmdb.org/t/p/original/xYijVAPunk6neVW2KHKE4Lp45ZU.jpg';
              const key = Key('MoviePosterComponent#$path');
              final finder = find.byKey(key);

              // Act
              await tester.pumpWidget(
                const MaterialApp(
                  home: Scaffold(
                    body: Center(
                      child: MoviePosterComponent(
                        height: height,
                        path: path,
                        width: width,
                      ),
                    ),
                  ),
                ),
              );
              await tester.pump(const Duration(seconds: 10));

              // Assert
              expect(finder, findsOneWidget);
              final widget = (tester.firstWidget(finder) as CachedNetworkImage);
              expect(widget.height, equals(height));
              expect(widget.width, equals(width));
              expect(widget.imageUrl, equals(path));
            },
          );
        },
      );
    },
  );
}
