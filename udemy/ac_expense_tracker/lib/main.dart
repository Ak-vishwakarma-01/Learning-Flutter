import 'package:ac_expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; 

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 97, 227, 94),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 6, 26, 7),
);

var kCardTheme = const CardTheme().copyWith(
  shadowColor: const Color.fromARGB(255, 31, 195, 77),
  color: const Color.fromARGB(255, 120, 245, 184),
  margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
);

var kTexTheme = ThemeData().textTheme.copyWith(
      titleLarge: const TextStyle(
        // this will apply to the appbar tittle automatically
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      titleMedium: const TextStyle(
        color: Color.fromARGB(255, 13, 88, 28),
        fontSize: 15,
        fontWeight: FontWeight.w800,
      ),
      titleSmall: const TextStyle(
        color: Color.fromARGB(255, 11, 70, 26),
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
    );

void main() {
  
  // WidgetsFlutterBinding.ensureInitialized(); // it will first ensrure that the screen orientation is set
  // SystemChrome.setPreferredOrientations(   // use to set the default orientation
  //   [
  //     DeviceOrientation.portraitUp  // setting the portrait orientation onling not in landscape
  //   ]
  // ).then((fn){    // then after it will run this future
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false, // it will remove the debug tab from rop right corner
        //ThemeData is a class that holds the configuration for the overall visual theme of a MaterialApp. It defines the colors, fonts, and other visual properties that the widgets in the app will use.
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkColorScheme,
          cardTheme:kCardTheme.copyWith( // using cardtheme again here because if it will be in dark mode then it will find margin of card theme in dark mode which i have used in expneses_list
            color: const Color.fromARGB(255, 54, 177, 82),  // overriding color
          ), 
          textTheme: kTexTheme.copyWith(   // overrriding color of title medium
            titleMedium:const TextStyle(
              color: Color.fromARGB(255, 134, 243, 137),
            ),
            titleSmall:const TextStyle(
              color: Color.fromARGB(255, 98, 227, 98),
            ),
            labelMedium: const TextStyle(
              color : Color.fromARGB(255, 134, 243, 137),  // used to change the color of lable
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
              foregroundColor: kDarkColorScheme.onPrimaryContainer,
            ),
          ),
        ),

        // with use of this can apply these to all widgets in this
        theme: ThemeData().copyWith(
          // using copywith will apply on all the widget
          // useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            // here appbar will use upper color KcolourSheme it will apply to all appbar
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme:kCardTheme, // this will override all the card with this , this will apply to all cards

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
            ),
          ),
          textTheme: kTexTheme,
        ),
        // themeMode: ThemeMode.system,   // is a default theme
        home: const Expenses(),
      ),
    );
  // });
}
