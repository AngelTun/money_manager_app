import 'package:flutter/material.dart';

// Pantalla para mostrar los gastos (ExpenseScreen)
class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea asegura que el contenido no se superponga con áreas del sistema (barra de estado, notch, etc.)
      body: SafeArea(
        // Column permite organizar widgets en una columna vertical
        child: Column(
          // Por ahora, la lista de hijos está vacía (pantalla vacía)
          children: [],
        ),
      ),
    );
  }
}
