import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key, 
    required this.meal, 
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMealFavorite = ref.watch(favoriteMealsProvider).contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasMealFavorited = ref
                .read(favoriteMealsProvider.notifier)
                .toggleMealFavoriteStatus(meal);
              
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    wasMealFavorited ? "Meal added as a favorite." : "Meal is no longer a favorite"
                  ),
                )
              );
            }, 
            icon: isMealFavorite ? Icon(Icons.star) : Icon(Icons.star_border)
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