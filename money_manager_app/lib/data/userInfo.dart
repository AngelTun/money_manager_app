// Enum para los tipos de transacción: salida (gasto) y entrada (ingreso)
enum TransactionType {
  outflow, // Salida de dinero (gasto)
  inflow   // Entrada de dinero (ingreso)
}

// Enum para las categorías de los ítems
enum ItemCategoryType {
  fashion,   // Moda
  grocery,   // Abarrotes/comida
  payments   // Pagos/transferencias
}

// Clase que almacena la información del usuario
class UserInfo {
  final String name;                  // Nombre del usuario
  final String totalBalance;          // Saldo total (en string)
  final String inflow;                // Total de ingresos (string)
  final String outflow;               // Total de egresos (string)
  final List <Transaction> transactions; // Lista de transacciones del usuario

  const UserInfo({
    required this.name, 
    required this.totalBalance, 
    required this.inflow, 
    required this.outflow, 
    required this.transactions
  });
}

// Clase que representa una transacción individual
class Transaction{
  final ItemCategoryType categoryType;        // Categoría del ítem
  final TransactionType transactionType;      // Tipo de transacción (entrada o salida)
  final String itemCategoryName;              // Nombre de la categoría
  final String itemName;                      // Nombre del ítem (por ejemplo, nombre del producto)
  final String amount;                        // Cantidad/dinero (string con formato)
  final String date;                          // Fecha de la transacción

  const Transaction(
    this.categoryType, 
    this.transactionType, 
    this.itemCategoryName, 
    this.itemName, 
    this.amount, 
    this.date
  );
}

// Lista de transacciones ejemplo 1
const List<Transaction> transactions1 = [
  Transaction(ItemCategoryType.fashion, TransactionType.outflow, "Shoes", 
      "Puma Sneaker", "\$3,500.00", "Oct, 23"),
  Transaction(ItemCategoryType.fashion, TransactionType.outflow, "Bag", 
      "Gucci Flax", "\$10,500.00", "Sep, 23")
];

// Lista de transacciones ejemplo 2
const List<Transaction> transactions2 = [
  Transaction(ItemCategoryType.payments, TransactionType.outflow, "Payments", 
      "Transfer from Eden", "13,500.00", "Oct, 2"),
  Transaction(ItemCategoryType.grocery, TransactionType.outflow, "Food", 
      "Chicken Wing", "1,500.00", "Oct, 10"),
  Transaction(ItemCategoryType.grocery, TransactionType.outflow, "Food", 
      "KFC", "499.00", "Oct, 10")
];

// Instancia de ejemplo de la información de un usuario
const userdata = UserInfo(
  name: "Angel", 
  totalBalance: "4,586.00", 
  inflow: "4,000.00", 
  outflow: "2,000.00",
  transactions: transactions1
);
