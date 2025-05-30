import 'dart:math'; // Para generar colores aleatorios

import 'package:flutter/material.dart';

import '../data/userInfo.dart'; // Importa modelos de datos, incluido Transaction
import '../utils/constants.dart'; // Importa constantes de diseño

// Widget para mostrar una transacción individual como un tile/tarjeta en lista
class TransactionItemTile extends StatelessWidget {
  final Transaction transaction; // Recibe una transacción a mostrar

  const TransactionItemTile({super.key, required this.transaction});

  // Método para obtener el signo "+" o "-" según el tipo de transacción
  String getSign(TransactionType type) {
    switch (type) {
      case TransactionType.inflow:
        return "+"; // Ingreso
      case TransactionType.outflow:
        return "-"; // Gasto
    }
  }

  // Método para obtener un color de fondo aleatorio
  Color getRandomBgColor(){
    return Color(Random().nextInt(0XFF000000));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Margen vertical entre cada tile
      margin: const EdgeInsets.symmetric(vertical: defaultSpacing / 2),
      // Decoración: sombra, color de fondo, bordes redondeados
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset.zero,
            blurRadius: 10,
            spreadRadius: 4
          )
        ],
        color: background,
        borderRadius: BorderRadius.all(Radius.circular(defaultRadius))
      ),
      child: ListTile(
        // Icono a la izquierda con fondo y padding
        leading: Container(
          padding: const EdgeInsets.all(defaultSpacing / 2),
          decoration: BoxDecoration(
            color: getRandomBgColor(), // Color aleatorio de fondo
            borderRadius: BorderRadius.all(Radius.circular(defaultRadius / 2))
          ),
          // Icono diferente según la categoría (fashion/otros)
          child: transaction.categoryType == ItemCategoryType.fashion
            ? const Icon(Icons.supervised_user_circle_sharp)
            : Icon(Icons.house)
        ),
        // Título principal: nombre de la categoría (ej: "Shoes", "Payments")
        title: Text(
          transaction.itemCategoryName,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: fontHeading,
            fontSize: fontSizeTitle,
            fontWeight: FontWeight.w700
          ),
        ),
        // Subtítulo: nombre del ítem (ej: "Puma Sneaker")
        subtitle: Text(
          transaction.itemName,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: fontSubHeading,
            fontSize: fontSizeBody,
          ),
        ),
        // Parte derecha: monto y fecha de la transacción
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Monto de la transacción con signo y color distinto para gastos/ingresos
            Text(
              "${getSign(transaction.transactionType)}${transaction.amount}",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: transaction.transactionType == TransactionType.outflow
                  ? Colors.red // Rojo si es gasto
                  : fontHeading, // Color normal si es ingreso
                fontSize: fontSizeBody
              ),
            ),
            // Fecha de la transacción en un tono más suave
            Text(
              transaction.date,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: fontSubHeading,
                fontSize: fontSizeBody,
              ),
            )
          ],
        ),
      )
    );
  }
}
