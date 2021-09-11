import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function togglefav;
  final Function isfav;
  MealDetail(this.togglefav, this.isfav);
  Widget buildHeadingTitile(
      {required BuildContext context, required String child}) {
    return Container(
      child: Text(
        child,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildItemList(
      {required BuildContext context, required Widget childsend}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 250,
      width: 350,
      child: childsend,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) {
      return element.id == mealId;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildHeadingTitile(context: context, child: 'Ingredients'),
            buildItemList(
              context: context,
              childsend: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: Text(selectedMeal.ingredients[index])),
                  );
                },
              ),
            ),
            buildHeadingTitile(context: context, child: 'Steps'),
            buildItemList(
              context: context,
              childsend: ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${(index + 1)}'),
                      ),
                      title: Text('${selectedMeal.steps[index]}'),
                    ),
                    Divider(
                      color: Colors.greenAccent,
                    )
                  ]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          togglefav(mealId);
        },
        child: Icon(
          isfav(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
