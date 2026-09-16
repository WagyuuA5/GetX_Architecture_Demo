import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_demo/main.dart' as app;

void main() {
  testWidgets('App starts at LoginView', (WidgetTester tester) async {
    Get.testMode = true;
    await app.main();
    await tester.pumpAndSettle();
    
    expect(find.text('Login'), findsOneWidget);
  });
}
