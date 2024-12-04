import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.fill,
  });

  final double fill;

// it is use to create chart;
  @override
  Widget build(BuildContext context) { //MediaQuery is a Flutter widget that provides information about the current app's environment, including screen size, device pixel ratio, text scale factor, and platform brightness (light/dark mode).
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark; // if the device is currently in dark mode.
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox( //its child to a fraction of the total available space. In this case, it's used to create the vertical bar in the chart.
          heightFactor: fill, //what fraction of the available height the box should occupy. 
          child: DecoratedBox(  //DecoratedBox: This widget draws a decoration (background, border, etc.) around its child. In this case, it's used to style the bar in the chart.
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius:                   
                  const BorderRadius.vertical(top: Radius.circular(8)),
              color: isDarkMode
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary.withOpacity(0.65),
            ),
          ),
        ),
      ),
    );
  }
}

