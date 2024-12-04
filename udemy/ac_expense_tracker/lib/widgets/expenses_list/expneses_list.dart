import 'package:ac_expense_tracker/models/expense.dart';
import 'package:ac_expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpnesesList extends StatelessWidget{
  const ExpnesesList({super.key , required this.expenses , required this.removeExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) removeExpense;

  @override
  Widget build( context) {
    // ListView Creates a scrollable, linear array of widgets that are created on demand.
    return ListView.builder(   // we don't know the toatl items then we should not use column widget , can use ListView 
      itemCount: expenses.length,
      itemBuilder: (ctx,index)=> Dismissible(  // Dismissible is use to slide the data which is inside this
        key: ValueKey(expenses[index]),       // key is use to identify that on sliding anthoder data should not delete
        background: Container(  // on sliding the color will be ther in background
          color: Theme.of(context).colorScheme.error.withOpacity(.5), // taking from main.dart
          margin:EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction){         // it takes direction where we want to slide left or right but here i am ignoring it;
          removeExpense(expenses[index]);
        },
        child:ExpensesItem(expenses[index]),    
      ),
    );
  }
}