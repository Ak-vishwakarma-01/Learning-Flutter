import 'package:ac_expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
     MaterialApp(
      //ThemeData is a class that holds the configuration for the overall visual theme of a MaterialApp. It defines the colors, fonts, and other visual properties that the widgets in the app will use.
      theme: ThemeData(useMaterial3: true),
      home:const Expenses(),
    ),
  );
}