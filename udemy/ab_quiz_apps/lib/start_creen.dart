import 'package:ab_quiz_apps/styled_text.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz,{super.key});
  
  final void Function() startQuiz;

  @override
  Widget build(context) {  
      return  Center( 
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(
              opacity: .8,
              child : Image.asset(
                'assets/images/quiz.png',
                width: 400,
                height: 400,
                fit: BoxFit.cover , 
                // color: const Color.fromARGB(29, 218, 205, 204),                  // to cover the image
              ),
            ),
            const SizedBox(height: 20,),
            const StyledText("Start The Quiz Here !",30,Color.fromARGB(255, 95, 209, 240)),
            const SizedBox(height: 20,),
            OutlinedButton.icon(
              onPressed: startQuiz,      // changing the screen 
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 154, 19, 169),
              ),
              icon: const Icon(                  // Adding icons to the button
                Icons.arrow_right_alt,
                size: 50,
                ),
              label: const StyledText("Continue",30,Colors.blue),
            ),
          ],
        ) 
    );
  }
}