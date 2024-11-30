import 'package:ab_quiz_apps/styled_text.dart';
import 'package:flutter/material.dart';

class AnswerButtons extends StatelessWidget{
  const AnswerButtons({super.key, required this.answerText, required this.onTap});
 
  final String answerText;
  final void Function() onTap;
   
  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(    // padding to the button
          vertical: 20,
          horizontal: 20,
        ),
        backgroundColor: const Color.fromARGB(255, 37, 5, 43),
        shape: RoundedRectangleBorder(       // giving some shape to the button
          borderRadius: BorderRadius.circular(50),
        )
      ), 
      child: StyledText(answerText, 11, Colors.white),
    );
  }
}