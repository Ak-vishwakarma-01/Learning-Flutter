import 'package:ae_meals/screens/categories_screen.dart';
import 'package:ae_meals/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

/*  
    How i am navigating the screen
    on clicking on categarries there is a function in category grid item which reference to the fucntion in 
    categories_screen.dart which is navigating to another screen which meals screen.

    same way in mealItem there is a function in meal iteam which reference to a functin in mealscrean 
    which is navigating to meals deatails screen which show details of the meal.
  
*/

final theme = ThemeData(
  // useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: TextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: TabsScreen(),
    );
  }
}