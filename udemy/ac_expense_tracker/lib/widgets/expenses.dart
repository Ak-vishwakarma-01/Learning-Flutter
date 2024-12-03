import 'package:ac_expense_tracker/widgets/expenses_list/expneses_list.dart';
import 'package:ac_expense_tracker/models/expense.dart';
import 'package:ac_expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }

}

class _ExpensesState extends State<Expenses>{

final List<Expense> _registeredExpenses = [
  Expense(
    title: "flutter course", 
    amount: 23.23, date: DateTime.now(), 
    category: Category.work,
    ),
    Expense(
    title: "Cinema", 
    amount: 12.32, date: DateTime.now(), 
    category: Category.leisure,
    ),
];

void _openAddExpneseOverlay(){
  
  // showModelBottomSheet wiill dynamically add new ui element
  // here argument contest is given derived by State globally in this class
  // context holds infromation about this Expnses class
  showModalBottomSheet(
    isScrollControlled: true,   // it will make to take full screen
    context: context, 
    builder: (ctx)=> NewExpense(onAddExpense: _addExpense,),  // on clickin gadd button this widget call will open
  );
}

void _addExpense(Expense expense) {
  setState(() { 
  _registeredExpenses.add(expense);
  });
}

void _removeExpense(Expense expense) {
  setState(() {
    _registeredExpenses.remove(expense);
  });
}

@override
Widget build(context){
  return Scaffold(
    appBar: AppBar(   // just by adding appBar it will leave space for camera
      title: const Text("flutter Expense Tracker"),
      actions: [
        IconButton(
          onPressed: _openAddExpneseOverlay,
          icon: const Icon(Icons.add),
          ),
      ],
    ),
    body: Column(
      children: [
        const Text("THE CHART"),
        Expanded(
          child:  ExpnesesList(expenses: _registeredExpenses, removeExpense: _removeExpense,),
          ),
      ],),
  );
}
}