import 'package:flutter/material.dart';
import 'package:expense_tracker_udemy/model/expense.dart';
class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key,required this.expense});
  final List<Expanse> expense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expense.length,itemBuilder: (ctx,index)=>Text(expense[index].title));
  }
}