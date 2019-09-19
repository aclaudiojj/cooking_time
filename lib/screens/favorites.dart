import 'package:cooking_time/models/meal.dart';
import 'package:cooking_time/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  final List<Meal> favoriteMeals;

  Favorites(this.favoriteMeals);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet!!'),
      );
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        return MealItem(widget.favoriteMeals[index]);
      },
      itemCount: widget.favoriteMeals.length,
    );
  }
}
