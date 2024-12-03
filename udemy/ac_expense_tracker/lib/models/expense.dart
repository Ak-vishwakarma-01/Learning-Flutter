import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();  // it is used to format the date 
const uuid = Uuid();   // use to generate unique id

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};
class Expense{

  Expense({
    required this.title, 
    required this.amount, 
    required this.date,
    required this.category
    }) : id= uuid.v4();   // it will initialize the unique id during constructor call

  final String id;
  final String title;
  final double amount; 
  final DateTime date;
  final Category category;

  String get formattedDate{
    return formatter.format(date);
  }
}