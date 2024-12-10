import 'package:ae_meals/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{  //StateNotifier is a class that holds and manages a state. It's designed to be immutable and provides a way to update the state in a controlled manner
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal){ // we can't update a variable value in this class just have to initalize a new object 
    final mealIsFavorite = state.contains(meal);
    
    if(mealIsFavorite){
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }else{
      state = [...state, meal];
      return true;
    }
  }
}


//StateNotifierProvider is used to expose a StateNotifier to the widget tree. It's a combination of a Provider and a StateNotifier. 
final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier,List<Meal>>(  //Dependency Injection: It allows you to inject the StateNotifier into your widget tree. //Lifecycle Management: It manages the lifecycle of the StateNotifier, creating and disposing of it as needed.
    (erf){
      return FavoriteMealsNotifier();
    }
);