import 'package:flutter/material.dart';
import '../../modal/categories.dart';
import '../../modal/meals.dart';
import 'meal_scr.dart';


class CategoriesScreen extends StatefulWidget {
       CategoriesScreen({super.key, required this.favorites, required this.myfilter});
   final List<Meal> favorites;
       Map<String, bool> myfilter;
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
         maxCrossAxisExtent: 200 ,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: categories.length,
        itemBuilder: (ctx, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MealsScreen(
                      categoryName: category.name,
                      favorites: widget.favorites,
                      myFilter: widget.myfilter,
                    ),
                  ),
                );
              }
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.antiAlias,
              elevation: 5,
              color: category.color,
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: FittedBox(
                    child: Text(
                      category.name,
                      style: const TextStyle(
                        fontFamily: 'mont',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
