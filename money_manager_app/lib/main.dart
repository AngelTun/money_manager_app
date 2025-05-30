import 'package:flutter/material.dart';
// Importa el widget principal que contiene las pestañas y la navegación
import 'package:money_manager_app/screens/main_screen_host.dart';

// Punto de entrada de la app
void main() {
  runApp(const MyApp()); // Inicia la app con el widget MyApp
}

// Widget principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Este widget es la raíz de tu aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Quita la etiqueta de "debug" en la app
      title: 'Flutter Demo', // Título de la app
      theme: ThemeData(
        // Define el esquema de colores y usa Material 3
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreenHost(), // Pantalla principal al iniciar la app
    );
  }
}

