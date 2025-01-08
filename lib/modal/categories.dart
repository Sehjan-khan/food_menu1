import 'package:flutter/material.dart';

class Category {
  final String name;
  final Color color;

  Category(this.name, this.color);
}

final categories = [
  Category('Italian', Colors.purple),
  Category('Quick & Easy', Colors.red),
  Category('Hamburgers', Colors.orange),
  Category('German', Colors.amber),
  Category('Light & Lovely', Colors.lightBlue),
  Category('Exotic', Colors.green),
  Category('Breakfast', Colors.blue),
  Category('Asian', Colors.lightGreen),
  Category('French', Colors.pink),
  Category('Summer', Colors.teal),
];
