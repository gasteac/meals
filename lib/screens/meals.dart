import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

/////////// pantalla donde estan las comidas de alguna categoria

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      required this.meals,
      this.title,
      required this.onToggleFavorite});
  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;
  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) =>
            MealItem(meal: meals[index], onToggleFavorite: onToggleFavorite));
    if (meals.isEmpty) {
      content = Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('ops, there are no meals here :(',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground)),
          const SizedBox(height: 15),
          Icon(Icons.sentiment_dissatisfied,
              size: 50, color: Theme.of(context).colorScheme.onBackground) 
        ],
      ));
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
