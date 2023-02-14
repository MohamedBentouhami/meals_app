import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';

import '../dummy_data.dart';

// ignore: use_key_in_widget_constructors
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES.map((catData) {
        return CategoryItem(catData.id, catData.title, catData.color);
      }).toList(),
    );
  }
}
