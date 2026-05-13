 import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key, 
    required this.meals, 
    this.title, 
  });

  final String? title;
  final List<Meal> meals;

  void _goToMealDetails(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal))
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget mainContent = meals.isNotEmpty ? ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
            return MealItem(
              meal: meals[index],
              onSelectMeal: () {
                _goToMealDetails(ctx, meals[index]);
              },
            );
        },  
      ) : Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),
              "Uh oh... nothing here!"
            ),
            const SizedBox(height: 16 ),
            Text(
              style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),
              "Try selecting a different category"
            ),
          ],
        )
      );

    if (title == null) {
      return mainContent;
    }

    return Scaffold(
      appBar: AppBar( 
        title: Text(title!)
      ),
      body: mainContent,
    );
  }
}