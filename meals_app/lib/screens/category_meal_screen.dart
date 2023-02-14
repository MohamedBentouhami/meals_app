import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import 'package:meals_app/models/meal.dart';

// ignore: use_key_in_widget_constructors
class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category_meals';
  final List<Meal> meals;

  const CategoryMealScreen(this.meals);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String? categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData = false;

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = widget.meals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle.toString()),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity,
              duration: displayedMeals[index].duration,
              imageUrl: displayedMeals[index].imageUrl,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
