import 'package:expense_tracker_udemy/widgits/expanses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_udemy/model/expense.dart';
class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key,required this.expense,required this.onRemoveExpense});
  final List<Expanse> expense;
  final void Function(Expanse expanse) onRemoveExpense;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expense.length,itemBuilder: (ctx,index)=>Dismissible(
      background: Container(
        color: Theme.of(context).colorScheme.error.withOpacity(0.75),
        margin: EdgeInsets.symmetric(horizontal: Theme.of(context,).cardTheme.margin!.horizontal),
      ),
      onDismissed: (directions){
        onRemoveExpense(expense[index]);
      },
        key: ValueKey(expense[index]),
        child: ExpenseItem(expense[index])
    )
    );
   //return ListView.builder(itemCount: expense.length,itemBuilder: (ctx,index)=>Text(expense[index].title));
  }
}