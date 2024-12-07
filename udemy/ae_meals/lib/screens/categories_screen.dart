import 'package:ae_meals/data/dummy_data.dart';
import 'package:ae_meals/models/category.dart';
import 'package:ae_meals/models/meal.dart';
import 'package:ae_meals/screens/meals_screen.dart';
import 'package:ae_meals/widgets/catogory_grid_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget{
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorie,
  });
  final void Function(Meal meal) onToggleFavorie;

  // Adding new Screen
  void _selectCategory(BuildContext context, Catogory category){   // it will take context to navigat to the new screen in the form of stack 
    final filterdMeals = dummyMeals.where(
      (meal) => meal.categories.contains(category.id),
    ).toList();

    Navigator.of(context).push(                 //When you navigate to a new screen using Navigator.push, the new screen is added to the navigation stack. The previous screen remains in the stack, allowing you to return to it.
      MaterialPageRoute(
        builder: (context) =>
          MealScreen(
            onToggleFavorite: onToggleFavorie,
            title: category.title, 
            meals: filterdMeals,
          ),
        ),
      );
    }


  @override
  Widget build(BuildContext context) {
    return  GridView(                // it will also scrollable
        padding: EdgeInsets.all(24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,        // setting num of colums
            childAspectRatio: 3/2     // sizing of the grid view option, height
        ),
        children: [
          // availablCategories.map((category => CatogoryGridItem(category: catogory,))).toList(),
          for(final catogory in availableCategories)
              CatogoryGridItem(
                category: catogory, 
                onSelectCategory: () =>
                  _selectCategory(context, catogory),
              ),
        ],
      );
  }
}
