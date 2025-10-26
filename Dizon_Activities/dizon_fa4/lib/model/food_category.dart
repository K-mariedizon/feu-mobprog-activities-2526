import 'package:flutter/material.dart';

enum HouseCategories{
  grocery,
  furniture,
  appliances,
}


class HouseCategory {
  const HouseCategory(this.title, this.color);

  final String title;
  final Color color;


}