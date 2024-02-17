import "package:expense_tracker_udemy/widgits/expenses_list.dart";
import "package:expense_tracker_udemy/model/expense.dart";
import "package:flutter/material.dart";

class Expense extends StatefulWidget{
  const Expense({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expense>{
  final List<Expanse> _registerdExpense=[
    Expanse(amount: 19.99, title: "flutter course", date: DateTime.now(), category: Category.work),
    Expanse(amount: 15.69, title: "cinama", date: DateTime.now(), category: Category.leisure),
  ];
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     appBar: AppBar(
       title: Text("dsvsvs"),
     )

     ,
     body:  Column(
       children: [
         DropdownButton(items: Category.values.map(
                 (category) =>DropdownMenuItem(
                   value: category,
                   child: Text(category.name.toUpperCase(),
                   ),
                 )
         ).toList(),
             onChanged: (anything){}
         ),
         const Text("The chart "),
         
         Expanded(child: ExpensesList(expense: _registerdExpense)),
       ],
     ),
   );
  }
}