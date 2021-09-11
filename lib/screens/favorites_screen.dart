import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  List<Meal> favmeals;
  FavoritesScreen(this.favmeals);
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favmeals.isEmpty) {
      return Container(
        child: Center(
          child: Text("No Favorites yet.Try adding some"),
        ),
      );
    } else {
      return Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: widget.favmeals[index].id,
              affordability: widget.favmeals[index].affordability,
              complexity: widget.favmeals[index].complexity,
              duration: widget.favmeals[index].duration,
              imageUrl: widget.favmeals[index].imageUrl,
              title: widget.favmeals[index].title,
            );
          },
          itemCount: widget.favmeals.length,
        ),
      );
    }
  }
}
