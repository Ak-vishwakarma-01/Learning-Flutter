import 'package:ac_expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      // it looks like card and it autmatically add some top and bottom margin and some design
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                    '₹${expense.amount.toStringAsFixed(2)}'), // it will print upto 2 decimal values only
                const Spacer(), // spacer will take all the space pushing text to the left and below row to the right , The Spacer widget in Flutter is used to create an adjustable, empty space between widgets in a Row, Column, or Flex container.
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
