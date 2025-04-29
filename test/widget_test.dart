import 'package:flutter_test/flutter_test.dart';
import 'package:group_five/main.dart';

void main() {
  testWidgets('HomeScreen displays Cineverse title', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Cineverse'), findsOneWidget);
  });
}