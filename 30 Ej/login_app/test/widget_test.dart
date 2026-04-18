import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_app/main.dart';

void main() {
  testWidgets('Verificación de arranque de la App', (
    WidgetTester tester,
  ) async {
    // 1. Intentamos cargar la aplicación
    await tester.pumpWidget(const MyApp());

    // 2. Esperamos a que todas las animaciones o cargas terminen
    await tester.pumpAndSettle();

    // 3. Verificamos si hay al menos un widget de tipo MaterialApp o WidgetsApp
    // Esto confirma que la base de la app funciona, sin importar qué ejercicio esté abierto.
    expect(find.byType(MaterialApp), findsOneWidget);

    print("--- ¡TEST SUPERADO: La aplicación arrancó correctamente! ---");
  });
}
