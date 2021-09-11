import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availabeMeals;
  CategoryMeals(this.availabeMeals);

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  var categortTtitle;
  late List<Meal> categoryMeal;
  var _loadedInitData = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final rutsarg =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categortTtitle = rutsarg['title'];
      final id = rutsarg['id'];
      categoryMeal = widget.availabeMeals.where((element) {
        return element.categories.contains(id);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      categoryMeal.removeWhere((element) {
        return element.id == mealId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var categoryMeals;
    return Scaffold(
      appBar: AppBar(
        title: Text('${categortTtitle}'),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeal[index].id,
              affordability: categoryMeal[index].affordability,
              complexity: categoryMeal[index].complexity,
              duration: categoryMeal[index].duration,
              imageUrl: categoryMeal[index].imageUrl,
              title: categoryMeal[index].title,
              //removeItem: _removeItem,
            );
          },
          itemCount: categoryMeal.length,
        ),
      ),
    );
  }
}
