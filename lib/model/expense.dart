import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';


final formatter=DateFormat.yMd();

const uuid=Uuid();

enum Category{food,travel,leisure,work}

const categoryIcon={
  Category.food : Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure:Icons.movie,
  Category.work :Icons.work,
};

class Expanse{
  Expanse ({required this.amount,required this.title,required this.date,required this.category}): id=uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;


  String get formatedDate{
    return formatter.format(date);
  }
}

class ExpenseBucket{
  const ExpenseBucket({required this.category,required this.expenses});

  ExpenseBucket.forCategory(List<Expanse>allExpanses,this.category):
  expenses=allExpanses.where((element) => element.category==category).toList();


  final Category category;
  final List<Expanse> expenses;

  double get totalExpenses{
    double sum=0;

    for(final expense in expenses){
      sum=sum+expense.amount;
    }

    return sum;
  }
}