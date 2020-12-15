import 'package:flutter/material.dart';
import 'package:food_app/widgets/main-drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = 'filters-screen';

  final Function saveFilters;
  final Map<String,bool> currentFilters;

  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _glutenFree=widget.currentFilters['gluten'];
    _lactoseFree=widget.currentFilters['lactose'];
    _vegan=widget.currentFilters['vegan'];
    _vegetarian=widget.currentFilters['vegetarian'];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final _selectedFilters={
                  'gluten':_glutenFree,
                  'lactose':_lactoseFree,
                  'vegan':_vegan,
                  'vegetarian':_vegetarian,
                };
                widget.saveFilters(_selectedFilters);
              },
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Filter Your Selected Meals',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  title: 'Gluten',
                  description: 'Only Include gluten-free meals.',
                  currentValue: _glutenFree,
                  triggeredSwitch: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  title: 'Lactose',
                  description: 'Only Include lactose-free meals.',
                  currentValue: _lactoseFree,
                  triggeredSwitch: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  title: 'Vegan',
                  description: 'Only Include vegan-free meals.',
                  currentValue: _vegan,
                  triggeredSwitch: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  title: 'Vegetarian',
                  description: 'Only Include vegetarian-free meals.',
                  currentValue: _vegetarian,
                  triggeredSwitch: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSwitchListTile(
      {String title,
      String description,
      bool currentValue,
      Function triggeredSwitch}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: triggeredSwitch,
    );
  }
}
