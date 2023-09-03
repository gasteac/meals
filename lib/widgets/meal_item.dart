import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals/screens/meal_details.dart';

/////////// objeto card de la comida (dentro de las categorias)

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onToggleFavorite});
  final void Function(Meal meal) onToggleFavorite;
  final Meal meal;
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: InkWell(
        ////////////////////////////////////////////////////////////////////////////////////
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => MealDetailsScreen(meal: meal, onToggleFavorite: onToggleFavorite)));
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 44),
                    child: Column(children: [
                      Text(meal.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                              icon: Icons.schedule,
                              label: '${meal.duration} min'),
                          const SizedBox(width: 10),
                          MealItemTrait(
                              icon: Icons.work, label: complexityText),
                          const SizedBox(width: 10),
                          MealItemTrait(
                              icon: Icons.attach_money,
                              label: affordabilityText),
                        ],
                      )
                    ])))
          ],
        ),
      ),
    );
  }
}
