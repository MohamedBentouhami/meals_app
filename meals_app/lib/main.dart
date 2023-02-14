import 'package:flutter/material.dart';

import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import 'models/meal.dart';
import 'screens/category_meal_screen.dart';

import './dummy_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filtrerData) {
    setState(() {
      _filters = filtrerData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] as bool && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] as bool && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] as bool && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodySmall: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyMedium: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            titleMedium: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      //home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FilterScreen.routeName: (context) =>
            FilterScreen(_filters, _setFilters),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
