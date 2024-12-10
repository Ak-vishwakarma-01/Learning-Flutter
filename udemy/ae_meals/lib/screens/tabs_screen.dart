import 'package:ae_meals/provider/favorite_provider.dart';
import 'package:ae_meals/provider/filters_provider.dart';
import 'package:ae_meals/provider/meals_provider.dart';
import 'package:ae_meals/screens/categories_screen.dart';
import 'package:ae_meals/screens/filers_Screen.dart';
import 'package:ae_meals/screens/meals_screen.dart';
import 'package:ae_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kIntialFilters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

class TabsScreen extends ConsumerStatefulWidget{  // to use provider we need to use consumer classes 
  const TabsScreen({
    super.key,
  });

  @override
  ConsumerState<TabsScreen>createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen>{    
  int _selectagePageIndex = 0;

  void _selectPage(int index){
    setState(() {
      _selectagePageIndex = index;
    });
  }

  void _setScreen(String identifier) async{
    Navigator.of(context).pop();
    if(identifier=="Filters"){           // switching to the filters Page
      final result  = await Navigator.of(context).push<Map<Filter,bool >>(        // it will automatically create a back arrow to comebacke from that page 
        MaterialPageRoute(
          builder: (context) => FilterdMeals(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {  // wheenere meals provider change thei context also update

    final meals = ref.watch(mealsProvider);
    final activeFilters = ref.watch(filtersProvider);  // When the state changes, the widget that uses ref.watch will be rebuilt, causing the UI to update accordingly. This is useful when you need to update a widget based on changes to the state.
    final availableMeals = meals.where((meal) {  // gettting this meals from provider;
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;  // If none of the above conditions are met, the meal is available
    }).toList();  
      
    Widget activePage  = CategoriesScreen(  // which page will be render
 
      availableMeals: availableMeals,
    );   
    var activePageTitle = "Categories";             // setting page title

    if(_selectagePageIndex==1){
      final FavoriteMeals = ref.watch(favoriteMealsProvider); // using provide to get the data, it automatically extract the data from notifier class 
      activePage = MealScreen( 
        meals: FavoriteMeals,          // passing favorite meals here

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