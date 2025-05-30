import 'package:flutter/material.dart';
// Importa constantes usadas para el diseño (colores, tamaños, etc.)
import 'package:money_manager_app/utils/constants.dart';

// Clase para almacenar los datos de la tarjeta de ingreso/egreso
class ExpenseData {
  final String label;    // Etiqueta ("Income" o "Expense")
  final String amount;   // Monto a mostrar
  final IconData icon;   // Icono a mostrar (flecha hacia arriba/abajo)

  const ExpenseData(this.label, this.amount, this.icon);
}

// Widget para mostrar una tarjeta (card) de ingreso o egreso
class IncomeExpenseCard extends StatelessWidget {

  final ExpenseData expenseData; // Datos que se mostrarán en la tarjeta
  
  const IncomeExpenseCard({super.key, required this.expenseData});

  @override
  Widget build(BuildContext context) {
    // Obtiene el tamaño de la pantalla (no se utiliza en este ejemplo, pero se puede usar para diseño responsivo)
    Size size = MediaQuery.of(context).size;
    return Container( 
      height: 80, // Altura fija para la tarjeta
      padding: const EdgeInsets.all(defaultSpacing), // Espaciado interno
      decoration: BoxDecoration(
        // Cambia el color de fondo según sea ingreso o egreso
        color: expenseData.label == "Income" ? primaryDark : accent,
        borderRadius: const BorderRadius.all(Radius.circular(defaultRadius))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Columna principal: etiqueta y monto
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Muestra la etiqueta ("Income" o "Expense")
                Text(
                  expenseData.label, 
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                ),
                // Muestra el monto debajo de la etiqueta, con espacio arriba
                Padding(
                  padding: const EdgeInsets.only(top: defaultSpacing / 3),
                  child: Text(
                    expenseData.amount, 
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white, 
                      fontWeight: FontWeight.w600
                    ),
                  ),
                )
              ],
            ),
          ),
          // Muestra el icono correspondiente (flecha arriba/abajo)
          Icon(expenseData.icon, color: Colors.white,)
        ],
      ),
    );
  }
}
