import 'package:flutter/material.dart';
import 'package:food_menu/screens/home/home_scr.dart';
import '../../Widget/snack.dart';
import '../../modal/meals.dart';

class MealDetailScreen extends StatefulWidget {
  final Meal meal;
  final List<Meal> favorites;
  const MealDetailScreen(
      {super.key, required this.meal, required this.favorites});

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  late bool isFavorite;
  @override
  void initState() {
    super.initState();
    var meal = meals.firstWhere(
      (meal) => meal.id == widget.meal.id,
    );
    isFavorite = widget.favorites.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFFFFF3E0)),
        title: Text(
          widget.meal.name,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'mont',
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                  if (isFavorite) {
                    if (!favorites.contains(widget.meal)) {
                      favorites.add(widget.meal);
                      ScaffoldMessenger.of(context).showSnackBar(
                          customSnackBar(
                            message: 'Added To Favorites',
                            backgroundColor: Colors.black,
                            duration: const Duration(milliseconds: 1500),
                            actionLabel: 'Undo',
                            onActionPressed: () {
                              setState(() {
                                favorites.remove(widget.meal);
                              });
                            },
                          )
                      );

                    }
                  } else {
                    if (favorites.contains(widget.meal)) {
                      setState(() {
                        favorites.remove(widget.meal);
                        customSnackBar(
                              message: 'Removed From Favorites',
                              backgroundColor: Colors.black,
                              duration: const Duration(milliseconds: 1500),
                              actionLabel: 'Undo',
                              onActionPressed: () {
                                setState(() {
                                  favorites.add(widget.meal);
                                });

                              }
                            );
                      });
                    }
                  }
                });
              },
              icon: isFavorite
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.meal.image,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Ingredients',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF7043),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widget.meal.ingredients.map((ingredient) {
                return Text(ingredient,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize: 16,
                    ));
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Steps to Make',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF7043),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widget.meal.steps.map((step) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    step,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize: 16,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
