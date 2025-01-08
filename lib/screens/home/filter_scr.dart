import 'package:flutter/material.dart';

import '../../Widget/snack.dart';


class FiltersScreen extends StatefulWidget {
  final Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen({
    super.key,
    required this.saveFilters,
    required this.currentFilters,
  });

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late bool isGlutenFree;
  late bool isLactoseFree;
  late bool isVegetarian;
  late bool isVegan;

  @override
  void initState() {
    super.initState();
    isGlutenFree = widget.currentFilters['gluten']!;
    isLactoseFree = widget.currentFilters['lactose']!;
    isVegetarian = widget.currentFilters['vegetarian']!;
    isVegan = widget.currentFilters['vegan']!;
  }

  Widget _buildSwitchTile(String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
      inactiveTrackColor: Theme.of(context).scaffoldBackgroundColor,
      inactiveThumbColor: Theme.of(context).textTheme.bodyLarge?.color,
      activeColor: Colors.green,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': isGlutenFree,
                'lactose': isLactoseFree,
                'vegetarian': isVegetarian,
                'vegan': isVegan,
              };
              widget.saveFilters(selectedFilters);
              if(isGlutenFree==false&&isLactoseFree==false&&isVegetarian==false&&isVegan==false){
                ScaffoldMessenger.of(context).showSnackBar(
                    customSnackBar(
                        message: 'Filters Removed',
                        backgroundColor: Colors.black,
                        duration: const Duration(seconds: 2),
                        actionLabel: 'View',onActionPressed: (){
                      Navigator.of(context).pop();
                    }
                    )
                );
              }else {
                ScaffoldMessenger.of(context).showSnackBar(
                  customSnackBar(
                    message: 'Filters Applied',
                    backgroundColor: Colors.black,
                    duration: const Duration(seconds: 2),
                    actionLabel: 'View',onActionPressed: (){
                    Navigator.of(context).pop();
                  }
                  )
              );
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSwitchTile(
            'Gluten-free',
            'Only include gluten-free meals.',
            isGlutenFree,
                (newValue) {
              setState(() {
                isGlutenFree = newValue;
              });
            },
          ),
          _buildSwitchTile(
            'Lactose-free',
            'Only include lactose-free meals.',
            isLactoseFree,
                (newValue) {
              setState(() {
                isLactoseFree = newValue;
              });
            },
          ),
          _buildSwitchTile(
            'Vegetarian',
            'Only include vegetarian meals.',
            isVegetarian,
                (newValue) {
              setState(() {
                isVegetarian = newValue;
              });
            },
          ),
          _buildSwitchTile(
            'Vegan',
            'Only include vegan meals.',
            isVegan,
                (newValue) {
              setState(() {
                isVegan = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
