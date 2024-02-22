import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:expense_tracker_udemy/model/expense.dart';
class NewExpense extends StatefulWidget{
  const NewExpense({super.key,required this.onAddExpense});
  final void Function(Expanse expanse) onAddExpense;
  @override
  State<NewExpense> createState()=>_NewExpenseState();
}

class _NewExpenseState extends State<NewExpense>{


  final _titleContoller=TextEditingController();
  final _amountContoller=TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory=Category.leisure;


  @override
  void dispose() {
    _titleContoller.dispose();
    _amountContoller.dispose();
    super.dispose();
  }

  void _presentDatePicker() async{
    final now=DateTime.now();
    final firstDate=DateTime(now.year-1,now.month,now.day);
    final pickedDate=await showDatePicker(
        context: context,
        firstDate: firstDate,
        lastDate: now
    );
    setState(() {
      _selectedDate=pickedDate;
    });
  }

  void _submitExpenseData(){
    final inputText = _amountContoller.text.trim();
    final enteredAmount=double.tryParse(inputText);
    final amountIsInvalid = enteredAmount==null || enteredAmount < 0;

    if(_titleContoller.text.trim().isEmpty|| amountIsInvalid|| _selectedDate==null)
    {//showing error message
      showDialog(context: context, builder: (ctx)=>AlertDialog(
        title:const  Text("Invalid Input"),
        content: const Text("Make sure you have valid amount,title,date and category is inputed "),
        actions: [
          TextButton(
              onPressed:() {
                Navigator.pop(ctx);
                print(enteredAmount);
                },
              child:const Text("ok"))
        ],
      ));
      return;
    }
    widget.onAddExpense(Expanse(amount: enteredAmount, title: _titleContoller.text, date: _selectedDate!, category: _selectedCategory));
    Navigator.pop(context);
  }


  @override
  Widget build(context){
    return Padding(
        padding:const EdgeInsets.fromLTRB(16, 48, 16, 46),
      child: Column(
        children: [
          TextField(
            controller: _titleContoller,
            maxLength: 50,
            decoration:const  InputDecoration(
              label: Text('Title'),
            ),
          ),
           Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountContoller,
                    keyboardType: TextInputType.number,
                    decoration:const  InputDecoration(
                      label: Text('Amount'),
                      prefix: Text("₹"),
                    ),
                  ),
                ),
                const SizedBox(width: 16,),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(_selectedDate == null? "NO date selected":formatter.format(_selectedDate!) ),
                      IconButton(
                          onPressed: _presentDatePicker,
                          icon: const Icon(Icons.calendar_month)
                      )
                    ],
                  ),
                 )
              ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[

              DropdownButton(
                value: _selectedCategory,
                  items: Category.values.map(
                      (category) =>DropdownMenuItem(
                    value: category,
                    child: Text(category.name.toUpperCase(),
                    ),
                  )
              ).toList(),
                  onChanged: (value){
                if(value==null) {
                  return;
                }
                setState(() {
                  _selectedCategory=value;
                });
                print(_selectedCategory);
                  }
              ),
              const Spacer(),

              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text("cancel")
              ),


              ElevatedButton(
                onPressed:_submitExpenseData,
                child: const Text("Save Expense"),
              ),

            ],
          ),

        ],
      ),
    );
  }
}

