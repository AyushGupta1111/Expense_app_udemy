import "package:expense_tracker_udemy/widgits/expanses_list/expenses_list.dart";
import "package:expense_tracker_udemy/model/expense.dart";
import "package:expense_tracker_udemy/widgits/new_expense.dart";
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
    Expanse(amount: 15.69, title: "cinema", date: DateTime.now(), category: Category.leisure),
  ];

  void _openAddExpenseOverlay(){
    showModalBottomSheet(context: context, builder: (cxt)=> NewExpense(onAddExpense: _addExpense,),
    isScrollControlled: true);
  }

  void _addExpense(Expanse expanse){
    _registerdExpense.add(expanse);
    setState(() {
    });
  }

  void _removeExpenses(Expanse expanse){
    setState(() {
      _registerdExpense.remove(expanse);
    });
  }


  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     appBar: AppBar(
       title:const  Text("Flutter expense app"),
       actions: [
         IconButton(
             onPressed: _openAddExpenseOverlay,
             icon:const  Icon(Icons.add)
         )
       ],
     )

     ,
     body:  Column(
       children: [

         const Text("The chart "),
         
         Expanded(child: ExpensesList(expense: _registerdExpense,onRemoveExpense: _removeExpenses,)),
       ],
     ),
   );
  }
}