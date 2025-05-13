import 'package:flutter/material.dart';
import 'package:money_manager_app/data/userInfo.dart';
import 'package:money_manager_app/utils/constants.dart';
import 'package:money_manager_app/widget/income_expense_card.dart';
import 'package:money_manager_app/widget/transaction_item_tile.dart';

class HomeScreenTab extends StatelessWidget {
  const HomeScreenTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox( 
                height: defaultSpacing * 4,
              ),
                ListTile(
                  title: Text("Hey! ${userdata.name}!"),
                  leading: ClipRRect( borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
                    child: Image.asset("assets/images/avatar.jpeg")),
                  trailing: Image.asset("assets/icons/bell.png"),
                  ),

                const SizedBox( 
                  height: defaultSpacing,
                ),

              Center(child: Column(
                children: [
                  Text(
                    "\$ ${userdata.totalBalance}", 
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: fontSizeHeading, 
                    fontWeight: FontWeight.w800),
                  ), 
                const SizedBox( 
                  height: defaultSpacing / 2,
                ),
                  Text(
                    "Total balance", 
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: 
                    fontSubHeading),
                  )
              ],),),

              const SizedBox(
                height: defaultSpacing * 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: IncomeExpenseCard(
                      expenseData: ExpenseData(
                        "Income", "\$${userdata.inflow}", Icons.arrow_upward_rounded))),
                SizedBox( 
                  width: defaultSpacing,
                ),
                  Expanded(child: IncomeExpenseCard(
                      expenseData: ExpenseData(
                        "Expense", "\$ ${userdata.outflow}", Icons.arrow_downward_rounded)))
              ],),
              SizedBox( 
                  width: defaultSpacing,
              ),
              Text("Recent Transactions", style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),),

              SizedBox( 
                  width: defaultSpacing,
              ),
              const Text("Today",
              style:  TextStyle(color: fontSubHeading),
              ),

              ...userdata.transactions.map((transaction) => TransactionItemTile(transaction: transaction,)),
              SizedBox( 
                  width: defaultSpacing,
              ),
              const Text("Today",
              style:  TextStyle(color: fontSubHeading),
              ),
              ...transactions2.map((transaction) => TransactionItemTile(transaction: transaction,)),
          ],),
      ),
    );
  }
}