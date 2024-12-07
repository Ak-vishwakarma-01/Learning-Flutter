import 'package:ae_meals/models/meal.dart';
import 'package:ae_meals/screens/meals_details_screen.dart';
import 'package:ae_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key, 
    this.title, 
    required this.meals,
    required this.onToggleFavorite,
    }
  );

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context,Meal meal){
    // Navigate to the MealDetailScreen with the selected meal
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => MealsDetailsScreen(
          onToggleFavorite: onToggleFavorite,
          meal: meal
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Nothing here.....",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(height: 16),
            Text(
              "Try Selecting a different category!",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ],
        ),
      );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,   //// need to give the item count
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index], 
          onSelectMeal: (context, meal) {
            selectMeal(context, meal);
          },
        ),
      );
    }

    if(title==null){
      return content;
    }
    return Scaffold(
      appBar: AppBar( 
        title: Text(title!),    // it will show an arrow , The arrow you are seeing before the title in the AppBar is the default back button provided by Flutter's Navigator when you push a new route onto the navigation stack.
      ),
      body: content,
    );
  }
}