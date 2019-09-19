import 'package:cooking_time/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> currentFilters;
  final Function saveFilters;

  Filters(this.currentFilters, this.saveFilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  initState() {
    this._glutenFree = widget.currentFilters['gluten'];
    this._lactoseFree = widget.currentFilters['lactose'];
    this._vegan = widget.currentFilters['vegan'];
    this._vegetarian = widget.currentFilters['vegetarian'];

    super.initState();
  }

  bool _glutenFree;
  bool _vegetarian;
  bool _vegan;
  bool _lactoseFree;

  Widget _buildSwitchTile(
    String title,
    String description,
    bool currentValue,
    Function valueChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: valueChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget.saveFilters({
              'gluten': this._glutenFree,
              'lactose': this._lactoseFree,
              'vegan': this._vegan,
              'vegetarian': this._vegetarian,
            }),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTile(
                  'Glutten-free',
                  'Only include gluteen free food',
                  this._glutenFree,
                  (newValue) => setState(
                    () => this._glutenFree = newValue,
                  ),
                ),
                _buildSwitchTile(
                  'Lactose-free',
                  'Only include lactose free food',
                  this._lactoseFree,
                  (newValue) => setState(
                    () => this._lactoseFree = newValue,
                  ),
                ),
                _buildSwitchTile(
                  'Vegetarian',
                  'Only include vegetarian food',
                  this._vegetarian,
                  (newValue) => setState(
                    () => this._vegetarian = newValue,
                  ),
                ),
                _buildSwitchTile(
                  'Vegan',
                  'Only include vegan food',
                  this._vegan,
                  (newValue) => setState(
                    () => this._vegan = newValue,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
