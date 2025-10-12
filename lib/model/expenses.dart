import 'package:flutter/material.dart';

enum ExpensesCategory { Shopping, Subscriptions, Food, Health, Transport }

final Map<ExpensesCategory, String> ExpensesCategoryImages = {
  ExpensesCategory.Shopping: '',
  ExpensesCategory.Subscriptions: '',
  ExpensesCategory.Food: '',
  ExpensesCategory.Health: '',
  ExpensesCategory.Transport: '',
};

final Map<ExpensesCategory, Color> ExpensesCategoryColor = {
  ExpensesCategory.Shopping: Colors.black,
  ExpensesCategory.Subscriptions: Colors.black,
  ExpensesCategory.Food: Colors.black,
  ExpensesCategory.Health: Colors.black,
  ExpensesCategory.Transport: Colors.black,
};

class Expenses {
  final int id;
  final String title;
  final double amount;
  final ExpensesCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Expenses({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'category': category.index,
      'date': date.toIso8601String(),
      'time': time.toIso8601String(),
      'description': description,
    };
  }

  factory Expenses.fromJSON(Map<String, dynamic> json) {
    return Expenses(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      category: ExpensesCategory.values[json['category']],
      date: DateTime.parse(json['date']),
      time: DateTime.parse(json['time']),
      description: json['description'],
    );
  }
}
