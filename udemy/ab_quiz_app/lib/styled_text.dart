import 'package:flutter/material.dart';

class StyledText extends StatelessWidget{
  const StyledText(this.text , this.size ,{super.key});
  
   final String text;
   final int size;
  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: size.toDouble(),
        fontWeight: FontWeight.w700,
      ),
    );
  }
}