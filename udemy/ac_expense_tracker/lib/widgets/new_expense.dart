import 'package:flutter/material.dart';
import 'package:ac_expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _StateNewExpense();
  }
}

class _StateNewExpense extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    // dispose means this is not needed anymore and only State class can implement dispose , statelesswidget can't
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDayPicker() async {
    final now = DateTime.now();
    final firstdate = DateTime(now.year - 1, now.month, now.day);
    // it will also popup new widget for date  // it is a future function
    final datepick = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstdate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = datepick;
    });
  }

  void _submitExpenseData() {
    final entereAmmount = double.tryParse(_amountController.text);
    final amountIsInvalid = entereAmmount == null || entereAmmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      // show an error message if data is invalid
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Invalid input"),
          content: const Text(
              "please make sure the title, amount date and catgory was intered"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(Expense(
      title: _titleController.text,
      amount: entereAmmount,
      category: _selectedCategory,
      date: _selectedDate!,  // it could be null also that't why
      ),
    );
    Navigator.pop(context); // to terminate the alloy which takes input
  }

  @override
  Widget build(context) {
     // it will check if app is in darkmode
     final isDarkMode = Theme.of(context).brightness == Brightness.dark;
     final textColor = isDarkMode 
      ? const Color.fromARGB(255, 134, 243, 137) 
      : Theme.of(context).textTheme.titleMedium?.color; 

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
      child: Column(
        children: [
          TextField(
            // onChanged: _saveTitleInput,  // instead of onchange function now use controller
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
            style: TextStyle(color: textColor), // it will only change it is in darkmode
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType:
                      TextInputType.number, // keyboard use to shwo input
                  decoration: const InputDecoration(
                      prefix: Text("\$ "), label: Text('Amount'),
                  ),
                  style: TextStyle(color: textColor), // it will only change it is in darkmode
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null  // updating the date here
                        ? "select date"
                        : formatter
                        .format(_selectedDate!),
                        style: Theme.of(context).textTheme.titleMedium, // it will change automatically by lookin is it in dark mode or not
                        ), 
                    IconButton(
                      onPressed: _presentDayPicker, // pop up new date picker
                      icon: const Icon(
                        Icons.calendar_month,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton(
                // DropDown button
                value: _selectedCategory, // inital it will show this
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  // on change the value will get updated here
                  if (value == null) return;
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // it will remove the overlays widget
                    },
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed:
                        _submitExpenseData, // submit the data to the server
                    child: const Text("Save Expense"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
