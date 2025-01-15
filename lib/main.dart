import 'package:flutter/material.dart';
import 'package:food_menu/screens/home/add_meals.dart';
import 'package:food_menu/screens/home/home_scr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ThemeMode _themeMode = ThemeMode.light;

  // void _toggleTheme() {
  //   setState(() {
  //     _themeMode =
  //     _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   fontFamily: 'pop',
      //   primaryColor: const Color(0xFFFFE4B5),
      //   scaffoldBackgroundColor: const Color(0xFFFFF3E0),
      //   listTileTheme: const ListTileThemeData(
      //     textColor: Color(0xFF8B4513),
      //   ),
      //   textTheme: const TextTheme(
      //     bodyLarge: TextStyle(color: Color(0xFF8B4513)),
      //     bodyMedium: TextStyle(color: Color(0xFFFFF3E0)),
      //     displayLarge: TextStyle(color: Color(0xFF6e3200)),
      //     titleLarge: TextStyle(color: Color(0xFF2b221c)),
      //     bodySmall: TextStyle(color: Color(0xFFFF7043))
      //   ),
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Color(0xFFFFA07A),
      //     foregroundColor: Color(0xFFFFF3E0),
      //   ),
      //   bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Color(0xFFFFA07A)),
      //
      // ),
      darkTheme: ThemeData(
        fontFamily: 'pop',
        primaryColor: const Color(0xFF2b221c),
        scaffoldBackgroundColor: const Color(0xFF2b221c),
        listTileTheme: const ListTileThemeData(
          textColor: Color(0xFFFFF3E0),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFFFFF3E0)),
          bodyMedium: TextStyle(color: Color(0xFFFFF3E0)),
          displayLarge: TextStyle(color: Color(0xFFFFA07A)),
          titleLarge: TextStyle(color: Color(0xFFFFF3E0)),
            bodySmall: TextStyle(color: Color(0xFFFFFFFF))
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2b221c),
          foregroundColor: Color(0xFFFFF3E0),
        ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor:  Color(0xFF2b221c)),
      ),
      debugShowCheckedModeBanner: false,
      home: const AddMeals(),
      // home: const HomeSC(filtersMap: {
      //     'glutenfree': false,
      //     'lactosfree': false,
      //     'vegetarian': false,
      //     'vegan': false,
      // },),
    );
  }
}