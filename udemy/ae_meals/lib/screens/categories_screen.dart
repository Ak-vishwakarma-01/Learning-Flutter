import 'package:ae_meals/data/dummy_data.dart';
import 'package:ae_meals/models/category.dart';
import 'package:ae_meals/models/meal.dart';
import 'package:ae_meals/screens/meals_screen.dart';
import 'package:ae_meals/widgets/catogory_grid_item.dart';
import 'package:flutter/material.dart';

// in this i used explicit animation
class CategoriesScreen extends StatefulWidget{
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}
                                                                  // mixin class
class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin{

  // initializing animation
  late AnimationController _animationController;
  

  // starting animation
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,                // it use to work for evryfram
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();  // direction of animation is up and down
  }

  // stoping animation
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Adding new Screen
  void _selectCategory(BuildContext context, Catogory category){   // it will take context to navigat to the new screen in the form of stack 
    final filterdMeals = widget.availableMeals.where(   // in statefull you can call the variables and function parent using widget 
      (meal) => meal.categories.contains(category.id),
    ).toList();

    Navigator.of(context).push(     //When you navigate to a new screen using Navigator.push, the new screen is added to the navigation stack. The previous screen remains in the stack, allowing you to return to it.
      MaterialPageRoute(
        builder: (context) =>
          MealScreen(
            title: category.title, 
            meals: filterdMeals,
          ),
        ),
      );
    }

  @override
  Widget build(BuildContext context) {
    // to animate we need to add everything in animationBuilder widget
    return AnimatedBuilder(
      animation: _animationController, 
      child: GridView(    // it will also scrollable
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
      ),
      builder: (context, child )=> SlideTransition( //The SlideTransition widget is used to create an animation that slides a child widget in and out of view
      position: //  _animationController.drive( // drive creates a new animation based on the current value of _animationController.
        Tween(    //Tween is an animation that interpolates between two values over a specified duration. In this case, the begin value is Offset(0, 0.3), which means the child widget will start at an offset of 30% from the top of the screen. The end value is Offset(0, 0), which means the child widget will end at the top of the screen.  
          begin: Offset( 0,0.3 ),  //Offset(0, 0.3): This Offset object represents a position that is 30% down from the top of the screen. In the context of the SlideTransition animation, this means the child widget will start at an offset of 30% from the top of the screen. Offset(0, 0): This Offset object represents the top of the screen. In the context of the SlideTransition animation, this means the child widget will end at the top of the screen.
          end:  Offset(0, 0),
        ).animate(CurvedAnimation(   
          parent: _animationController, 
          curve: Curves.easeInOut,
          ),
        ),
     // ),
      child: child,
      ),
      /*
      Padding(
        padding: EdgeInsets.only(             
          top: 100 - _animationController.value * 100,  // with forword and using 100 -  will slide up
        ), 
        child: child,
      ),
       */
    );
  }
}
