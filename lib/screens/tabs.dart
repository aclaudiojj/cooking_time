import 'package:cooking_time/models/meal.dart';
import 'package:cooking_time/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:cooking_time/screens/categories.dart';
import 'package:cooking_time/screens/favorites.dart';

class Tabs extends StatefulWidget {
  static const routeName = '/';

  final List<Meal> favoriteMeals;

  Tabs(this.favoriteMeals);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List<Map<String, Object>> _screens;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    this._screens = [
      {'screen': Categories(), 'title': 'Categories'},
      {'screen': Favorites(widget.favoriteMeals), 'title': 'Favorites'},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedPageIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: this._selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          )
        ],
      ),
    );
  }
  // TOP NAVIGATION BAR
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: 2,
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: Text('Meals'),
  //         bottom: TabBar(
  //           tabs: <Widget>[
  //             Tab(
  //               icon: Icon(Icons.category),
  //               text: 'Categories',
  //             ),
  //             Tab(
  //               icon: Icon(Icons.favorite),
  //               text: 'Favorites',
  //             ),
  //           ],
  //         ),
  //       ),
  //       body: TabBarView(
  //         children: <Widget>[
  //           Categories(),
  //           Favorites(),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
