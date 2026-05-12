import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key, 
    required this.meal, 
    required this.onToggleFavorite,
  });

  final Meal meal;
  final Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(meal);
            }, 
            icon: Icon(Icons.star)
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              meal.imageUrl
            ),
            const SizedBox(height: 14),
            Text(
              style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold
                ),
              "Ingredients"
            ),
            const SizedBox(height: 14),
            for (final ingredient in meal.ingredients)
              Text(
                style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ingredient
              ),
            const SizedBox(height: 14),
            Text(
              style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold
                ),
              "Steps"
            ),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
                  step
                ),
              )
          ],
        ),
      ),
    );
  }
}