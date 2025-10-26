import 'package:dizon_fa4/model/food_category.dart';
import 'package:dizon_fa4/data/food_categories.dart';
import 'package:dizon_fa4/model/grocery_item.dart';

final groceryItems = [
  HouseItem(
  id: 'a',
  name: 'Vegetables',
  quantity: 2,
  houseCategory: HouseCategories.grocery,
  ),
 HouseItem(
  id: 'b',
  name: 'Table',
  quantity: 2,
  houseCategory: HouseCategories.furniture,
  ),
  HouseItem(
  id: 'a',
  name: 'Oven',
  quantity: 2,
  houseCategory: HouseCategories.appliances,
  ),
];