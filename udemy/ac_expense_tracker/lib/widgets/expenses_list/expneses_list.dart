import 'package:ac_expense_tracker/models/expense.dart';
import 'package:ac_expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpnesesList extends StatelessWidget{
  const ExpnesesList({super.key , required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build( context) {
    return ListView.builder(   // we don't know the toatl items then we should not use column widget , can use ListView 
      itemCount: expenses.length,
      itemBuilder: (ctx,index)=> ExpensesItem(expenses[index]),    // Creates a scrollable, linear array of widgets that are created on demand.
    );
  }
}