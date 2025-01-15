import 'package:flutter/material.dart';
import 'package:food_menu/screens/home/home_scr.dart';

import '../../Widget/snack.dart';


class FiltersScreen extends StatefulWidget {
  final Map<String,bool> filters;
  const FiltersScreen({
    super.key, required this.filters,
  });

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
 static bool isGlutenFree = false;
 static bool isLactoseFree = false;
 static bool isVegetarian = false;
 static bool isVegan = false;


 // Future<void> saveFilterState() async {
 //   SharedPreferences sp = await SharedPreferences.getInstance();
 //   sp.setBool('glutenfree', isGlutenFree);
 //   sp.setBool('lactosefree', isLactoseFree);
 //   sp.setBool('vegetarian', isVegetarian);
 //   sp.setBool('vegan', isVegan);
 // }

  Widget _buildSwitchTile(
      String title, String subtitle, bool value, Function(bool) onChanged) {
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            if(isGlutenFree==false&&isLactoseFree==false&&isVegetarian==false&&isVegan==false) {
              ScaffoldMessenger.of(context).showSnackBar(
                  customSnackBar(
                    message: 'Filters removed',
                    backgroundColor: Colors.black,
                    duration: const Duration(milliseconds: 1500),
                  )
              );
            }else{
              ScaffoldMessenger.of(context).showSnackBar(
                  customSnackBar(
                    message: 'Filters applied',
                    backgroundColor: Colors.black,
                    duration: const Duration(milliseconds: 1500),
                  )
              );
            }
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeSC(
                  filtersMap: {
                    'glutenfree': isGlutenFree,
                    'lactosfree': isLactoseFree,
                    'vegetarian': isVegetarian,
                    'vegan': isVegan,
                  },
                  )),
            );
          },
        ),
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
              // saveFilterState();
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
              // saveFilterState();
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
              // saveFilterState();
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
              // saveFilterState();
            },
          ),
        ],
      ),
    );
  }
}
