import 'package:expense_tracker_udemy/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget{
  const ExpenseItem(this.expanse,{super.key});
  final Expanse expanse;
  @override
  Widget build(BuildContext context) {
    return
       Card(
         child: Padding(
       padding: const EdgeInsets.symmetric(
       horizontal: 20,
           vertical: 16
       ),
        child: Column(
          children: [
            Text(expanse.title,
            style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4,),
            Row(
              children: [
                Text('₹${expanse.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcon[expanse.category]),
                    const SizedBox(width: 8,),
                    Text(expanse.formatedDate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}