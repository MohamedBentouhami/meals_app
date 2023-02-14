import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

// ignore: use_key_in_widget_constructors
class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  Map<String, bool> currenFilters;

  FilterScreen(this.currenFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFree = widget.currenFilters['gluten'] as bool;
    _lactoseFree = widget.currenFilters['lactose'] as bool;
    _vegan = widget.currenFilters['vegan'] as bool;
    _vegetarian = widget.currenFilters['vegetarian'] as bool;
  }

  Widget _buildSwitchListTitle(String title, String description,
      bool currentValue, void Function(bool) updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectFiltres = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                };

                widget.saveFilters(selectFiltres);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust you meal selection.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTitle('Gluten free',
                    'Only include gluten-free meals', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTitle(
                    'Lactose free',
                    'Only include lactose-free meals',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTitle(
                    'Vegetarian', 'Only include vegetarien meals', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTitle(
                    'Vegan', 'Only include vegan meals', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
