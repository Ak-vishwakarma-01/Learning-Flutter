import 'package:ac_expense_tracker/widgets/chart/chart.dart';
import 'package:ac_expense_tracker/widgets/expenses_list/expneses_list.dart';
import 'package:ac_expense_tracker/models/expense.dart';
import 'package:ac_expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "flutter course",
      amount: 23.23,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Cinema",
      amount: 12.32,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

    // showModelBottomSheet wiill dynamically add new ui element
    // here argument contest is given derived by State globally in this class
    // context holds infromation about this Expnses class
  void _openAddExpneseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,              // it will make sure that it will not overlap with the camera
      isScrollControlled: true,       // it will make to take full screen
      context: context,
      builder: (ctx) => NewExpense(       // on clicking add button this widget call will open
        onAddExpense: _addExpense,
      ), 
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars(); // it will cleaer privous snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      // It is use to show the notification button to bottom
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted'),
        action: SnackBarAction(
            label: "Undo", // this will be button connected to the onpressed
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width; // it will check the width in current orientation

    Widget mainContent = const Center(
      child: Text("No expenses available"),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpnesesList(
        expenses: _registeredExpenses,
        removeExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        // just by adding appBar it will leave space for camera
        title: const Text(
          "Flutter Expense Tracker",
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpneseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width<600 ? Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent,
          ),
        ],
      )
      : Row(
          children: [
            Expanded(    // in chart we have use size infinite double that's why we have to use Expanded
              child: Chart(expenses: _registeredExpenses),
            ),
            Expanded(
              child: mainContent,
          ),
        ], 
      )
    );
  }
}
