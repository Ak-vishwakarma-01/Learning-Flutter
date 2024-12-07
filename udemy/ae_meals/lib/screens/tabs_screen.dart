import 'package:ae_meals/models/meal.dart';
import 'package:ae_meals/screens/categories_screen.dart';
import 'package:ae_meals/screens/meals_screen.dart';
import 'package:ae_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget{
  const TabsScreen({
    super.key,
  });

  @override
  State<TabsScreen>createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen>{
  int _selectagePageIndex = 0;
  final List<Meal> _favoriteMeals= [];  // empty list to make vavorite list

  void showInfoMeassage(String message){
    ScaffoldMessenger.of(context).clearSnackBars(); // clear snackbar
    ScaffoldMessenger.of(context).showSnackBar(  // snackmessge when i click on favorite start
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _toggleFavoriteMealStatus(Meal meal){
    final isExisting = _favoriteMeals.contains(meal);
    if(isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
      }); 
      showInfoMeassage("Item removed from the favorites");
    }else {
      _favoriteMeals.add(meal);
      showInfoMeassage("Item added to the favorites");
    }
  }

  void _selectPage(int index){
    setState(() {
      _selectagePageIndex = index;
    });
  }

  void _setScreen(String identifier){
    if(identifier=="Filters"){

    }else{
      Navigator.of(context).pop();   //
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage  = CategoriesScreen(onToggleFavorie: _toggleFavoriteMealStatus,);   // which page will be render
    var activePageTitle = "Categories";             // setting page title

    if(_selectagePageIndex==1){
      activePage = MealScreen( 
        meals: _favoriteMeals,          // passing favorite meals here
        onToggleFavorite: _toggleFavoriteMealStatus,
      );
      activePageTitle = "Your favorites";       // changing page title
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen,),                       // ******************it will open a side drawer // or side navbar to the left ************************
      body: activePage,                           // it will change screen
      bottomNavigationBar: BottomNavigationBar(   // it use to add a navigation bar on bottom
        onTap: _selectPage,  
        currentIndex: _selectagePageIndex,        // it will highlight the current page Icon                 // on clickiing it will change screen
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'favorites',
          ),
        ],
      ),
    );
  }
}