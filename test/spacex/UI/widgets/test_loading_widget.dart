import 'package:appnation_flutter_test/spacex/UI/widgets/loading_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should return the loading widget', (WidgetTester tester) async {
    await tester.pumpWidget(const LoadingWidget());
  });
}
