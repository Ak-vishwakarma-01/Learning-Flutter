import 'dart:math';

import 'package:aa_first/styled_text.dart';
import 'package:flutter/material.dart';


class DiceRoller extends StatefulWidget{
  const DiceRoller({super.key});
  @override 
  State<DiceRoller> createState(){
    return _DiceRoller();
  }
}

class _DiceRoller extends State<DiceRoller>{
   
  // to show these image you have to make changes in pubspec.yml for assets  
  var activeDiceImage = 'assets/images/1.png';

   void rollDice(){     // running on every click
    setState((){
      activeDiceImage = 'assets/images/${Random().nextInt(6) + 1}.png';
    });
   }

  @override
  Widget build(context){
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              activeDiceImage,      // changing on every click
              width: 150,
              ),
            const SizedBox(height: 0,),     // it will just add a some height in between instead of padding we can use it
            TextButton(
              onPressed: rollDice,         // on presss call it
              style: TextButton.styleFrom(
                foregroundColor: Colors.white70,
                padding: const EdgeInsets.only(top: 20),
                ), 
              child: const StyledText("Roll Dice",30),
            ),
          ],
        );
  }
}