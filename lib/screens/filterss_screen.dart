import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/widgets/maindrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters_screen';
  final Function filterdata;
  final Map<String, bool> filters;
  FiltersScreen(this.filters, this.filterdata);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenfreen = false;

  var _isvegan = false;

  var _vagetarian = false;

  var _lactosefree = false;
  @override
  void initState() {
    _glutenfreen = widget.filters['gluten'] as bool;
    _isvegan = widget.filters['vegan'] as bool;
    _vagetarian = widget.filters['vegetarian'] as bool;
    _lactosefree = widget.filters['lactose'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedfilter = {
                  'gluten': _glutenfreen,
                  'vegan': _isvegan,
                  'vegetarian': _vagetarian,
                  'lactose': _lactosefree,
                };

                widget.filterdata(selectedfilter);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust according to you ",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    value: _glutenfreen,
                    title: Text('Gluten-free'),
                    subtitle: Text('Only include gluten free foods'),
                    onChanged: (newValue) {
                      setState(() {
                        _glutenfreen = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: _lactosefree,
                    title: Text('Lactose-free'),
                    subtitle: Text('Only include lactose free foods'),
                    onChanged: (newValue) {
                      setState(() {
                        _lactosefree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: _isvegan,
                    title: Text('vegan'),
                    subtitle: Text('Only include  vegan  foods'),
                    onChanged: (newValue) {
                      setState(() {
                        _isvegan = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: _vagetarian,
                    title: Text('vagetarian'),
                    subtitle: Text('Only include vagetarian foods'),
                    onChanged: (newValue) {
                      setState(() {
                        _vagetarian = newValue;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
