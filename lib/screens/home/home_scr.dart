import 'package:flutter/material.dart';
import 'package:food_menu/screens/home/catgaroies_screen.dart';
import 'package:food_menu/screens/home/favorites.dart';
import 'package:lottie/lottie.dart';
import '../../modal/meals.dart';
import 'filter_scr.dart';



class HomeSC extends StatefulWidget {
  final ThemeMode themeMode;
  final VoidCallback toggleTheme;

   const HomeSC({super.key, required this.toggleTheme, required this.themeMode});
  @override
  State<HomeSC> createState() => _HomeSCState();
}
List<Meal> favorites = [];
class _HomeSCState extends State<HomeSC> {
  var bottomIndex = 0;
  final Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      CategoriesScreen(
        favorites: favorites,
        currentFilters: _filters,
      ),
      FavoritesScreen(favorites: favorites),
    ];
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters.addAll(filterData);
    });
  }

  List<String> title = ["Categories", "Your Favorites"];

  @override
  Widget build(BuildContext context) {

    final isDarkMode = widget.themeMode == ThemeMode.dark;

    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 0.75,
        color: isDarkMode ? const Color(0xFF2b221c) : const Color(0xFFFFF3E0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              color: isDarkMode ? const Color(0xFF6e3200) : const Color(0xFFFFA07A),
              child: Center(
                  child: Lottie.asset(
                      isDarkMode ?
                      'assets/animation/dark.json' :
                      'assets/animation/Animation - 1735037150481.json',
                      width: 250)),
            ),
            ListTile(
              onTap: () {
                bottomIndex == 1
                    ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeSC(
                          toggleTheme: widget.toggleTheme,
                          themeMode: widget.themeMode)),
                )
                    : Navigator.pop(context);
              },
              title: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Meals',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              leading: Icon(
                Icons.fastfood_outlined,
                size: 30,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FiltersScreen(
                        currentFilters: _filters, saveFilters: _setFilters,
                      )),
                );
              },
              title: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Filters',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              leading: Icon(
                Icons.filter_list_alt,
                size: 30,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
            ),
            Text(
              'Made By Sehjan',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFFFFF3E0),
        ),
        title: Text(
          title[bottomIndex],
          style: const TextStyle(fontWeight: FontWeight.w600, fontFamily: 'mont'),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      body: screens[bottomIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            bottomIndex = index;
          });
        },
        currentIndex: bottomIndex,
        selectedItemColor: isDarkMode ? const Color(0xFFFF7043) : const Color(0xFFFFFFFF),
        unselectedItemColor: const  Color(0xFFECC8BA),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
