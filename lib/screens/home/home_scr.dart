import 'package:flutter/material.dart';
import 'package:food_menu/screens/home/add_meals.dart';
import 'package:food_menu/screens/home/catgaroies_screen.dart';
import 'package:food_menu/screens/home/favorites.dart';
import '../../modal/meals.dart';
import 'filter_scr.dart';

class HomeSC extends StatefulWidget {
  final Map<String, bool> filtersMap;

  const HomeSC({super.key, required this.filtersMap});
  @override
  State<HomeSC> createState() => _HomeSCState();
}

List<Meal> favorites = [];

class _HomeSCState extends State<HomeSC> {


  var bottomIndex = 0;
   Map<String, bool> filters = {};
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
     filters = widget.filtersMap;
    // Initialize the screens list here after filters is initialized
    screens = [
      CategoriesScreen(
        favorites: favorites,
        myfilter: filters,
      ),
      FavoritesScreen(favorites: favorites),
    ];
  }

  List<String> title = ["Categories", "Your Favorites"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddMeals()));
      },
      backgroundColor: const Color(0xFFFFF3E0),
        child: const Icon(Icons.add,color: Color(0xFF2b221c),size: 30,),
      ),
      drawer: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 0.75,
        color: const Color(0xff2b221c),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              color: const Color(0xFF8B4513),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset('assets/images/imgs.png',width: 50,),
                  ),
                   Text('Cooking Up!',style: TextStyle(fontSize: 20,decoration: TextDecoration.overline),)
                ],
              ),
            ),
            ListTile(
              onTap: () {
                bottomIndex == 1
                    ? Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeSC(
                                  filtersMap: {},
                                )),
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
                            filters: filters,
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
          style:
              const TextStyle(fontWeight: FontWeight.w600, fontFamily: 'mont'),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //      Icons.light_mode,
        //     ),
        //     onPressed: widget.toggleTheme,
        //   ),
        // ],
      ),
      body: screens[bottomIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            bottomIndex = index;
          });
        },
        currentIndex: bottomIndex,
        selectedItemColor: Theme.of(context).textTheme.bodySmall?.color,
        unselectedItemColor: const Color(0xFFECC8BA),
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
