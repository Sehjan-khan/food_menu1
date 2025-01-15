import 'package:flutter/material.dart';
import '../../modal/meals.dart';
import 'meal_details.dart';

class MealsScreen extends StatefulWidget {
  final String categoryName;
  final List<Meal> favorites;
  final Map<String, bool> myFilter;
  const MealsScreen(
      {super.key,
      required this.categoryName,
      required this.favorites,
      required this.myFilter});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  Widget build(BuildContext context) {
    bool applyFilters(Meal meal) {
      if (widget.myFilter['glutenfree']! && !meal.isGlutenFree) {
        return false;
      }
      if (widget.myFilter['lactosfree']! && !meal.isLactoseFree) {
        return false;
      }
      if (widget.myFilter['vegetarian']! && !meal.isVegetarian) {
        return false;
      }
      if (widget.myFilter['vegan']! && !meal.isVegan) {
        return false;
      }
      return true;
    }

    var categoryMeals = meals.where((e) {
      return e.category.contains(widget.categoryName) && applyFilters(e);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryName,
          style: const TextStyle(
            fontFamily: 'mont',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFFFFF3E0),
        ),
      ),
      body: categoryMeals.isEmpty
          ? Center(
              child: Text(
                'No Meals Here!',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontSize: 18,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: categoryMeals.length,
              itemBuilder: (ctx, index) {
                final meal = categoryMeals[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MealDetailScreen(
                            meal: meal, favorites: widget.favorites, onUpdateFavorites: () {}),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              meal.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: 160,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withValues(alpha: 0.6)
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            right: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  meal.name,
                                  style: const TextStyle(
                                    fontFamily: 'mont',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.timer,
                                        color: Color(0xFFFFF3E0), size: 16),
                                    const SizedBox(width: 5),
                                    Text(
                                      '${meal.preparationTime} Min',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    const Icon(Icons.work,
                                        color: Color(0xFFFFF3E0), size: 16),
                                    const SizedBox(width: 5),
                                    Text(
                                      meal.type,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Text(
                                      '₹ ${meal.price.toStringAsFixed(0)}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
