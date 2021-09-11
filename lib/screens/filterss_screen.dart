import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/widgets/maindrawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters_screen';
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
        ),
        drawer: MainDrawer(),
        body: Container(
          child: Text('Filters Screen'),
        ));
  }
}
