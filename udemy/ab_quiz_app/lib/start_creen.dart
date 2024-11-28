import 'package:ab_quiz_app/styled_text.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  const StartScreen({super.key});
  
  @override
  Widget build(context) {  
      return const Center( 
        child: 
        StyledText("Start The Quiz Here",20),
    );
  }
}