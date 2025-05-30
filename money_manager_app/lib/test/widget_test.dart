// Prueba básica de widgets en Flutter.
//
// Puedes interactuar con los widgets en tu test usando WidgetTester
// que te permite simular taps, scrolls y verificar el contenido visual del widget.

// Importa los widgets de Flutter
import 'package:flutter/material.dart';
// Ignora la advertencia de usar dependencias referenciadas directamente en tests
// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
// Importa el punto de entrada principal de la app
import 'package:money_manager_app/main.dart';

void main() {
  // Define una prueba de widgets llamada 'Counter increments smoke test'
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Construye la app e inicia el primer frame
    await tester.pumpWidget(const MyApp());

    // Verifica que el contador inicie en 0
    expect(find.text('0'), findsOneWidget); // Busca el texto '0' (debe estar presente)
    expect(find.text('1'), findsNothing);   // Busca el texto '1' (no debe estar presente aún)

    // Simula un tap en el botón con el icono '+' (add) y actualiza el frame
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verifica que el contador haya incrementado a 1
    expect(find.text('0'), findsNothing);    // Ya no debe estar el texto '0'
    expect(find.text('1'), findsOneWidget);  // Ahora debe aparecer el texto '1'
  });
}
