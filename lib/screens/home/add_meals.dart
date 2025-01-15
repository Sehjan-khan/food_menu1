import 'package:flutter/material.dart';
import 'package:food_menu/modal/meals.dart';

import '../../Widget/textfield.dart';

class AddMeals extends StatefulWidget {
  const AddMeals({super.key});

  @override
  State<AddMeals> createState() => _AddMealsState();
}

class _AddMealsState extends State<AddMeals> {
  TextEditingController id = TextEditingController();
  TextEditingController category = TextEditingController();
  String name = '';
  String image = '';
  List<String> ingredients = [];
  List<String> steps = [];
  int preparationTime = 0;
  double price = 0;
  String type = '';
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegetarian = false;
  bool isVegan = false;

  submiteMeal() {
    Meal(
        id: id.toString(),
        category: category.toString(),
        name: name,
        image: image,
        ingredients: ingredients,
        steps: steps,
        preparationTime: preparationTime,
        price: price,
        type: type,
        isGlutenFree: isGlutenFree,
        isLactoseFree: isLactoseFree,
        isVegetarian: isVegetarian,
        isVegan: isVegan);
  }

  @override
  Widget build(BuildContext context) {
    print(category);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adding Meals'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: CustomTextFormField(
              controller: id,
              obscure: false,
              hintText: 'Meal Name',
              keyboardType: TextInputType.name,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: DropdownMenu(
              controller: category,
              hintText: 'Categories',
              keyboardType: TextInputType.name,
              enableSearch: true,
              inputDecorationTheme: const InputDecorationTheme(
                  fillColor: Color(0xFFFFFFFF), filled: true,focusColor: Color(0xFFFFFFFF),),
              trailingIcon: const Icon(Icons.arrow_drop_down_circle_outlined),
              selectedTrailingIcon:
                  const Icon(Icons.arrow_drop_down_circle_rounded),
              dropdownMenuEntries: [
                DropdownMenuEntry(value: category, label: 'Italian'),
                DropdownMenuEntry(value: category, label: 'Quick & Easy'),
                DropdownMenuEntry(value: category, label: 'Hamburgers'),
                DropdownMenuEntry(value: category, label: 'German'),
                DropdownMenuEntry(value: category, label: 'Light & Lovely'),
                DropdownMenuEntry(value: category, label: 'Exotic'),
                DropdownMenuEntry(value: category, label: 'Breakfast'),
                DropdownMenuEntry(value: category, label: 'Asian'),
                DropdownMenuEntry(value: category, label: 'French'),
                DropdownMenuEntry(value: category, label: 'Summer'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
