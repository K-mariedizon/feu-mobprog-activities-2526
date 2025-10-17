import 'package:flutter/material.dart';

class MenuItemModel {
  final String id;
  final String name;
  final double price;
  final String category; 
  final IconData icon;

  MenuItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.icon,
  });
}
