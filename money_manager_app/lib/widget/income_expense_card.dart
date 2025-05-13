import 'package:flutter/material.dart';
import 'package:money_manager_app/utils/constants.dart';

class ExpenseData {
  final String label;
  final String amount;
  final IconData icon;


  const ExpenseData(this.label, this.amount, this.icon);
}
class IncomeExpenseCard extends StatelessWidget {

  final ExpenseData expenseData;
  
  const IncomeExpenseCard({super.key, required this.expenseData});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container( 
      height: 80,
      padding: const EdgeInsets.all(defaultSpacing),
      decoration: BoxDecoration(
        color:expenseData.label == "Income" ? primaryDark : accent,
        borderRadius: const BorderRadius.all(Radius.circular(defaultRadius))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expenseData.label, 
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: defaultSpacing / 3),
                  child: Text(
                    expenseData.amount, 
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                )],
            ),
          ),
          Icon(expenseData.icon, color: Colors.white,)
      ],
    ),);
  }
}