import 'package:flutter/material.dart';
import 'package:cooking_time/data.dart';
import 'package:cooking_time/widgets/category_item.dart';

class Categories extends StatelessWidget {
  static const routeName = 'categories-list';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: CATEGORIES
          .map(
            (categoryData) => CategoryItem(categoryData),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
