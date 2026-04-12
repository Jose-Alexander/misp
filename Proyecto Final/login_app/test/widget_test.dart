import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:login_app/main.dart';

void main() {
  testWidgets('Verificación de flujo completo JOJ', (
    WidgetTester tester,
  ) async {
    await mockNetworkImagesFor(() async {
      // 1. Iniciar app
      await tester.pumpWidget(const JojApp());
      await tester.pumpAndSettle();

      // 2. Login
      await tester.enterText(find.byType(TextField).at(0), 'admin');
      await tester.enterText(find.byType(TextField).at(1), '1234');
      await tester.tap(find.byType(ElevatedButton));

      // 3. Esperar transición
      await tester.pumpAndSettle();

      // 4. Verificar éxito
      expect(find.byType(BottomNavigationBar), findsOneWidget);
      debugPrint("--- ¡TEST SUPERADO CON ÉXITO! ---");
    });
  });
}
