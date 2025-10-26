import 'package:flutter/foundation.dart';
import 'package:dizon_fa4/model/food_category.dart';
import 'package:flutter/material.dart';

class HouseItem {
  const HouseItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.houseCategory,
  });
  

  final String id;
  final String name;
  final int quantity;
  final HouseCategories houseCategory;
}

const categoryIcons = {
  HouseCategories.grocery: Icons.local_grocery_store,
  HouseCategories.furniture: Icons.chair,
  HouseCategories.appliances: Icons.kitchen,
 
};

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<HouseItem> allExpenses, this.category)
    : expenses = allExpenses
          .where((expense) => expense.houseCategory == category)
          .toList();

  final HouseCategories category;
  final List<HouseItem> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.quantity;
    }

    return sum;
  }
}