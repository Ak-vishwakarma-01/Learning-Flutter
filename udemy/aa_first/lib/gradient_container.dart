import 'package:aa_first/dice_roller.dart';
import 'package:flutter/material.dart';
   
  const  startAligment = Alignment.topLeft;
  const endAligment = Alignment.bottomRight;

// flutter automatically call build method when it sees a widget
class GradientContainer extends StatelessWidget{
  const GradientContainer({super.key, required this.colors}); 
   
  // Named constructor for creating a purple gradient container
  GradientContainer.purple({super.key})
    : colors = [Colors.black, Colors.purple];


  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(  
      decoration: BoxDecoration(
        gradient: LinearGradient(              // how the ui color will change from topleft to bottomright
          colors: colors,
          begin: startAligment,
          end: endAligment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}