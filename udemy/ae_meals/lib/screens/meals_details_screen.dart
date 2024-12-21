import 'package:ae_meals/models/meal.dart';
import 'package:ae_meals/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
 why Riverpod is used 
 Dependency Injection: . In this case, it's used to inject the favoriteMealsProvider.
State Management: state management across the app. The favoriteMealsProvider is likely managing the state of favorite meals.
Reactivity: Riverpod enables reactive programming. When the state changes, it automatically rebuilds 
*/
class MealsDetailsScreen extends ConsumerWidget{  // to use of provider in stateless we use consumerwidget
  const MealsDetailsScreen({
    super.key,
    required this.meal,

  });

  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {  // this ref lesten to providers
    final favoritmeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoritmeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),  
        actions: [
          IconButton(
            onPressed: () {     // on clicking will make fvorie or delete varorite
            final wasAdded = ref        //When you use ref.read, the widget will not be rebuilt when the state changes
              .read(favoriteMealsProvider.notifier)
              .toggleMealFavoriteStatus(meal); 

              ScaffoldMessenger.of(context).clearSnackBars(); // clear snackbar
              ScaffoldMessenger.of(context).showSnackBar(  // snackmessge when i click on favorite start
              SnackBar(
                content: Text(wasAdded ? 'Meal added as a Favorite' : 'Meal Removed'),
                backgroundColor: Colors.green,
                ),
              ); 
            }, 
            icon: AnimatedSwitcher(   // putting Icon insside AnimatedSwitcher to animate icon
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: animation, 
                  child: child,  // this child is referencing the child icon
                ); 
              },
              child: Icon( isFavorite ? Icons.star : Icons.star_border, 
               key: ,  // key is important without this it will not animate that which widget it wants to animate 
              ), 
            ) 
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