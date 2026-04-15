import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meals_item.dart';

import 'meal_details_screen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.mealList,
    required this.onToggleFavourite,
  });

  final String? title;
  final List<Meal> mealList;
  final void Function(Meal meal) onToggleFavourite;

  @override
  Widget build(BuildContext context) {
    Widget bodyContent;
    if (mealList.isEmpty) {
      bodyContent = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Uh.. oh Nothing here",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Try selecting a different category",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      );
    } else {
      bodyContent = ListView.builder(
        itemCount: mealList.length,
        itemBuilder: (cxt, index) {
          return MealsItem(
            meal: mealList[index],
            onSelectMeal: (meal) {
              onMealSelected(meal, context);
            },
          );
        },
      );
    }

    if (title == null) {
      return bodyContent;
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: bodyContent,
    );
  }

  void onMealSelected(Meal meal, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealDetailsScreen(meal: meal, onToggleFavourite: onToggleFavourite),
      ),
    );
  }
}
