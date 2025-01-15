import 'package:flutter/material.dart';
import 'package:food_menu/screens/home/home_scr.dart';
import '../../modal/meals.dart';
import 'meal_details.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key, required this.favorites});
  final List<Meal> favorites;

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}


class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    setState(() {
      favorites;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.favorites.isEmpty
          ? Center(
        child: Text(
          'No favorites yet!',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontSize: 18,
          ),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: widget.favorites.length,
        itemBuilder: (ctx, index) {
          final meal = widget.favorites[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MealDetailScreen(meal: meal, favorites: widget.favorites, onUpdateFavorites: () { setState(() {
                  }); },),
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
                          colors: [Colors.transparent, Colors.black.withValues(alpha: 0.6)],
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
                              const Icon(Icons.timer, color: Color(0xFFFFF3E0), size: 16),
                              const SizedBox(width: 5),
                              Text(
                                '${meal.preparationTime} Min',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 15),
                              const Icon(Icons.work, color: Color(0xFFFFF3E0), size: 16),
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
