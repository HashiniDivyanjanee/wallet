import 'package:flutter/material.dart';

enum IncomeCategory { Salary, Freelance, PassiveIncome, Sales }

final Map<IncomeCategory, String> IncomeCategoryImage = {
  IncomeCategory.Salary: "",
  IncomeCategory.Freelance: "",
  IncomeCategory.PassiveIncome: "",
  IncomeCategory.Sales: "",
};

final Map<IncomeCategory, Color> IncomeCategoryColor = {
  IncomeCategory.Salary: Colors.black,
  IncomeCategory.Freelance: Colors.black,
  IncomeCategory.PassiveIncome: Colors.black,
  IncomeCategory.Sales: Colors.black,
};

class Income {
  final int id;
  final String title;
  final double amount;
  final IncomeCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Income({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });
}
