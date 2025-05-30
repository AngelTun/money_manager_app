import 'package:flutter/material.dart';
// Importa la información del usuario (nombre, balance, etc.)
import 'package:money_manager_app/data/userInfo.dart';
// Importa constantes como colores, tamaños, etc.
import 'package:money_manager_app/utils/constants.dart';
// Importa el widget de tarjeta de ingresos/gastos
import 'package:money_manager_app/widget/income_expense_card.dart';
// Importa el widget para mostrar una transacción individual
import 'package:money_manager_app/widget/transaction_item_tile.dart';

// Este widget representa la pantalla principal del Home (tab de inicio)
class HomeScreenTab extends StatelessWidget {
  const HomeScreenTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Permite que el contenido se desplace verticalmente
      child: Padding(
        padding: const EdgeInsets.all(defaultSpacing), // Padding alrededor del contenido
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinea los hijos a la izquierda
          children: [
            const SizedBox( 
              height: defaultSpacing * 4, // Espacio arriba
            ),
            // Tarjeta de usuario en la parte superior (nombre, avatar, campana de notificaciones)
            ListTile(
              title: Text("Hey! ${userdata.name}!"), // Saludo personalizado con el nombre del usuario
              leading: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
                child: Image.asset("assets/images/avatar.jpeg") // Avatar del usuario
              ),
              trailing: Image.asset("assets/icons/bell.png"), // Icono de campana
            ),
            const SizedBox( 
              height: defaultSpacing, // Espacio debajo del ListTile
            ),
            // Sección de saldo total centrada
            Center(
              child: Column(
                children: [
                  Text(
                    "\$ ${userdata.totalBalance}", // Muestra el saldo total del usuario
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: fontSizeHeading, 
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  const SizedBox( 
                    height: defaultSpacing / 2, // Espacio pequeño
                  ),
                  Text(
                    "Total balance", // Texto descriptivo debajo del saldo
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: fontSubHeading
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: defaultSpacing * 2, // Espacio grande debajo del saldo
            ),
            // Fila con tarjetas de Ingresos y Egresos
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: IncomeExpenseCard(
                    expenseData: ExpenseData(
                      "Income", "\$ ${userdata.inflow}", Icons.arrow_upward_rounded
                    )
                  )
                ),
                SizedBox( 
                  width: defaultSpacing, // Espacio entre las tarjetas
                ),
                Expanded(
                  child: IncomeExpenseCard(
                    expenseData: ExpenseData(
                      "Expense", "\$ ${userdata.outflow}", Icons.arrow_downward_rounded
                    )
                  )
                )
              ],
            ),
            SizedBox( 
              width: defaultSpacing, // Espacio después de la fila
            ),
            // Título de la sección de transacciones recientes
            Text(
              "Recent Transactions", 
              style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox( 
              width: defaultSpacing, // Espacio debajo del título
            ),
            // Subtítulo para el día actual
            const Text(
              "Today",
              style: TextStyle(color: fontSubHeading),
            ),
            // Lista de transacciones de hoy (primer grupo)
            ...userdata.transactions.map((transaction) => TransactionItemTile(transaction: transaction,)),
            SizedBox( 
              width: defaultSpacing, // Espacio después de la primera lista
            ),
            // Segundo subtítulo (quizá para separar otros tipos de transacciones)
            const Text(
              "Yesterday",
              style: TextStyle(color: fontSubHeading),
            ),
            // Lista de transacciones secundarias (segundo grupo)
            ...transactions2.map((transaction) => TransactionItemTile(transaction: transaction,)),
          ],
        ),
      ),
    );
  }
}
