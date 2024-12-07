import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget{
  const MainDrawer({
    super.key,
    required this.onSelectScreen,
  });

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(        
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(      // staylining of the 
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withOpacity(.5),  
                ],
                begin:Alignment.topLeft ,
                end: Alignment.bottomRight,
              )
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,   // it will show the icon on side drawer
                  size: 48,
                  color :  Colors.red,
                ),
                const SizedBox(width: 20,),
                Text(
                  "Cooking Up!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primaryFixed,
                  ),
                ),
              ],
            ),
          ),
          // after DrawerHeader we will ad to different pages link
          ListTile(  //used to create items in a list or menu ,way to create a row with some text and optional leading and trailing widgets.
            leading: Icon(     // inside leading we use icon or image  and trailing also
              Icons.restaurant,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              "Meals",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 24,
              ),
            ),
            onTap: () {            // to load screen;
              onSelectScreen("Meals");
            },
          ),
          ListTile(  //used to create items in a list or menu ,way to create a row with some text and optional leading and trailing widgets.
            leading: Icon(     // inside leading we use icon or image  and trailing also
              Icons.settings,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              "Filters",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 24,
              ),
            ),
            onTap: () {
              onSelectScreen("Filters");
            },
          ),
        ],
      ),
    );
  }
}