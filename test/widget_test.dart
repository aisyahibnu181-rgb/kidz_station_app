import 'package:flutter_test/flutter_test.dart';
import 'package:kidz_station_app/main.dart';

void main() {
  testWidgets('Kidz Station app starts', (tester) async {
    await tester.pumpWidget(const KidzStationApp());
    expect(find.byType(KidzStationApp), findsOneWidget);
  });
}
