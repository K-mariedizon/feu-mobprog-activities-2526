import 'package:flutter/material.dart';
import 'package:shopping_app/model/food_category.dart';

const foodCategories={
  FoodCategories.vegetables: FoodCategory(
  'vegetables',
  Colors.greenAccent
  ),
  FoodCategories.fruits: FoodCategory(
  'fruits',
  Color.fromARGB(255, 214, 219, 58)
  ),
  FoodCategories.meat: FoodCategory(
  'meat',
  Color.fromARGB(255, 222, 74, 84)
  ),
  FoodCategories.sweets: FoodCategory(
  'sweets',
  Color.fromARGB(255, 201, 69, 162)
  ),
  FoodCategories.spices: FoodCategory(
  'spices',
  Color.fromARGB(255, 1, 12, 7)
  ),
};