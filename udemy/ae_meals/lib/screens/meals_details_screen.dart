import 'package:ae_meals/models/meal.dart';
import 'package:flutter/material.dart';

class MealsDetailsScreen extends StatelessWidget{
  const MealsDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
  });

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),  
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(meal);  // on clicking will make fvorie or delete varorite
            },
            icon: Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14,),
            Text(
              'Ingeridient',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              )
            ),
            const SizedBox(height: 14,),
            for(final ingredient  in meal.ingredients)
              Text(ingredient, style: TextStyle(
                 color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            const SizedBox(height: 24,),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              )
            ),
            const SizedBox(height: 14,),
            for(final step  in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text(step, style: TextStyle(
                   color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
} 