import 'package:appnation_flutter_test/spacex/UI/view/spacex_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('should return SpaceXView', () {
    testWidgets('should return SpaceXView', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SpaceXView()));
      await tester.pump(Duration.zero);
    });
  });
}
