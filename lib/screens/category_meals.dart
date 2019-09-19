import 'package:cooking_time/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:cooking_time/data.dart';
import 'package:cooking_time/widgets/category_item.dart';
import 'package:cooking_time/widgets/meal_item.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMeals(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    final categoryItem =
        ModalRoute.of(context).settings.arguments as CategoryItem;
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryItem.category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryItem.category.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
