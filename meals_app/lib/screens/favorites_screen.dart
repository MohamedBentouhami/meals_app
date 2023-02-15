import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

// ignore: use_key_in_widget_constructors
class FavoritesScreen extends StatelessWidget {
  List<Meal> _favoritesMeals;
  FavoritesScreen(this._favoritesMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoritesMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return MealItem(
          id: _favoritesMeals[index].id,
          title: _favoritesMeals[index].title,
          affordability: _favoritesMeals[index].affordability,
          complexity: _favoritesMeals[index].complexity,
          duration: _favoritesMeals[index].duration,
          imageUrl: _favoritesMeals[index].imageUrl,
        );
      },
      itemCount: _favoritesMeals.length,
    );
  }
}
