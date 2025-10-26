import 'package:shopping_app/model/food_category.dart';
import 'package:shopping_app/data/food_categories.dart';
import 'package:shopping_app/model/grocery_item.dart';

final groceryItems = [
  GroceryItem(
  id: 'a',
  name: 'kangkong',
  quantity: 2,
  foodCategory: foodCategories[FoodCategories.vegetables]!,
  ),
  GroceryItem(
  id: 'b',
  name: 'apple',
  quantity: 2,
  foodCategory: foodCategories[FoodCategories.fruits]!,
  ),
  GroceryItem(
  id: 'c',
  name: 'chicken',
  quantity: 2,
  foodCategory: foodCategories[FoodCategories.meat]!,
  ),
  GroceryItem(
  id: 'd',
  name: 'candy',
  quantity: 2,
  foodCategory: foodCategories[FoodCategories.sweets]!,
  ),
  GroceryItem(
  id: 'e',
  name: 'salt',
  quantity: 2,
  foodCategory: foodCategories[FoodCategories.spices]!,
  ),
];