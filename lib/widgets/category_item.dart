import 'package:flutter/material.dart';
import 'package:cooking_time/models/category.dart';
import 'package:cooking_time/screens/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem(this.category);

  void selectCategory(BuildContext buildContext) {
    Navigator.of(buildContext).pushNamed(
      CategoryMeals.routeName,
      arguments: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => this.selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          this.category.title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              this.category.color.withOpacity(0.7),
              this.category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
