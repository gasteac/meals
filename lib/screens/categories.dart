import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';

/////////// pantalla donde estan las categorias

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, 
  required this.onToggleFavorite,
  required this.availableMeals});

  final List<Meal> availableMeals;
  final void Function(Meal meal) onToggleFavorite;
  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(meals: filteredMeals, title: category.title, onToggleFavorite: onToggleFavorite,)));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            for (final category in availableCategories)
              CategoryGridItem(
                  category: category,
                  onSelectedCategory: () {
                    _selectedCategory(context, category);
                  })
          ],
    );
  }
}
