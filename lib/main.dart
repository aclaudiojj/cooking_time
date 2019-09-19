import 'package:cooking_time/data.dart';
import 'package:cooking_time/screens/filters.dart';
import 'package:flutter/material.dart';
import 'package:cooking_time/screens/categories.dart';
import 'package:cooking_time/screens/category_meals.dart';
import 'package:cooking_time/screens/meal_detail.dart';
import 'package:cooking_time/screens/tabs.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      this._filters = filterData;

      this._availableMeals = MEALS.where((meal) {
        if (this._filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }

        if (this._filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }

        if (this._filters['vegan'] && !meal.isVegan) {
          return false;
        }

        if (this._filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    final existingIndex =
        _favoriteMeals.indexWhere((eachMeal) => eachMeal == meal);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(MEALS.firstWhere((eachMeal) => eachMeal == meal));
      });
    }
  }

  bool _isMealFavorite(Meal meal) {
    return _favoriteMeals.any((eachMeal) => eachMeal == meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // initialRoute: Categories.routeName,
      routes: {
        Tabs.routeName: (_) => Tabs(_favoriteMeals),
        Categories.routeName: (_) => Categories(),
        CategoryMeals.routeName: (_) => CategoryMeals(this._availableMeals),
        MealDetail.routeName: (_) =>
            MealDetail(_toggleFavorite, _isMealFavorite),
        Filters.routeName: (_) => Filters(_filters, _setFilters),
      },
      // onGenerateRoute: (settings) => MaterialPageRoute(
      //   builder: (context) => Categories(),
      // ),
      // onUnknownRoute: , - error page, for instance
    );
  }
}
