import 'package:ae_meals/provider/filters_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FilterdMeals extends ConsumerWidget{
  const FilterdMeals({
    super.key,
  });

/*
Navigator.push():
Adds a new route on top of the current route stack.
The previous route remains in the stack, allowing the user to go back to it.

Navigator.pushReplacement():
Replaces the current route in the stack with a new one.
The current route is removed from the stack and replaced by the new route.
*/

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered Meals'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier){  // calling directly navigator will remove backbutton and her we we are rellacing it with the listButton
      //   Navigator.pop(context);
      //   if(identifier=='Meals'){
      //     Navigator.pushReplacement(
      //       context, 
      //       MaterialPageRoute(
      //         builder: (context) => TabsScreen(),
      //       ),
      //     );
      //   }
      // }),
      body: Column(
          children: [
            SwitchListTile(  // SwitchListTile widget in Flutter is used to create a list item with a switch (toggle) control. It's particularly useful in settings screens or anywhere you need to allow users to toggle a boolean option on or off. Combination of ListTile and Switch:
              value: _glutenFreeFilterSet, 
              onChanged: (isChecked){      // onChanged is a callback function that gets called whenever the switch is toggled (i.e., when its state changes from on to off or vice versa). The function takes a single parameter isChecked, which is a boolean value. This value represents the new state of the switch: true if the switch has been turned on false if the switch has been turned off
                ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree,isChecked);
              },
              title: Text(
                "Bluten-free",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 23),
            ),
            SwitchListTile(  // SwitchListTile widget in Flutter is used to create a list item with a switch (toggle) control. It's particularly useful in settings screens or anywhere you need to allow users to toggle a boolean option on or off. Combination of ListTile and Switch:
              value: _lactoseFreeFilterSet, 
              onChanged: (isChecked){      // onChanged is a callback function that gets called whenever the switch is toggled (i.e., when its state changes from on to off or vice versa). The function takes a single parameter isChecked, which is a boolean value. This value represents the new state of the switch: true if the switch has been turned on false if the switch has been turned off
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                "lactose-free",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include Lactose-free meals',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 23),
            ), 
            SwitchListTile(  // SwitchListTile widget in Flutter is used to create a list item with a switch (toggle) control. It's particularly useful in settings screens or anywhere you need to allow users to toggle a boolean option on or off. Combination of ListTile and Switch:
              value: _vegeterianFilterSet, 
              onChanged: (isChecked){      // onChanged is a callback function that gets called whenever the switch is toggled (i.e., when its state changes from on to off or vice versa). The function takes a single parameter isChecked, which is a boolean value. This value represents the new state of the switch: true if the switch has been turned on false if the switch has been turned off
                setState(() {
                  _vegeterianFilterSet = isChecked;
                });
              },
              title: Text(
                "vegetarian",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include vegetarian meals',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 23),
            ),
            SwitchListTile(  // SwitchListTile widget in Flutter is used to create a list item with a switch (toggle) control. It's particularly useful in settings screens or anywhere you need to allow users to toggle a boolean option on or off. Combination of ListTile and Switch:
              value: _veganFilterSet, 
              onChanged: (isChecked){      // onChanged is a callback function that gets called whenever the switch is toggled (i.e., when its state changes from on to off or vice versa). The function takes a single parameter isChecked, which is a boolean value. This value represents the new state of the switch: true if the switch has been turned on false if the switch has been turned off
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              title: Text(
                "Vegan",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include Vegan meals',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 23),
            ),
          ],
        ),
      );
  }
}

/* 
  PopScope(     //  It's used to control the behavior when a user attempts to pop the current route (e.g., by pressing the back button on Android).
        canPop: false,   //canPop: false: This property determines whether the route can be popped. Setting it to false means that the default pop behavior is disabled. The user can't simply pop this route by default actions like pressing the back button.
        onPopInvokedWithResult: (  //This callback is invoked when a pop is requested. It provides more control over the pop behavior.
            bool didPop,    //A boolean indicating whether the pop was already handled by the system. If true, the pop has already occurred.
            dynamic result,  //result: The result that would be returned by the pop operation.
          ) {  
          if(didPop) return;    // If didPop is true, we should return immediately
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegeterianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          Navigator.of(context).pop();
        },
*/