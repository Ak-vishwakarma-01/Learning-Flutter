import 'package:ab_quiz_apps/styled_text.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary(this.anssummary ,{super.key});

  final List<Map<String,Object>> anssummary ;

  @override
  Widget build(BuildContext context) {
    return SizedBox( 
      height: 500,
      child: SingleChildScrollView(      // it is used to scroll if the height increased
        child: Column(
          children: anssummary.map(
            (data) {
            return Container(
              margin: const EdgeInsets.only(left: 20 , bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const Icon(Icons.arrow_right,size: 35,color:Colors.white),
                StyledText(((data['question-index'] as int)+1).toString(),25,Colors.blue),
                const SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        StyledText(data['question'] as String,20,const Color.fromARGB(255, 209, 176, 241) ),
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            const SizedBox(height: 5,),
                            StyledText(data['user-answer'] as String,15,
                            data['user-answer']==data['correct-answer'] ? const Color.fromARGB(255, 16, 237, 82): const Color.fromARGB(255, 232, 38, 38)
                            ),
                            const SizedBox(height: 5,),
                            StyledText((data['correct-answer'] as String),15,const Color.fromARGB(255, 16, 237, 82) ),
                          ]
                        )),
                    ],
                  ),
                ),
              ],),
            );
          }).toList(),
        ),
      ),
    );
  }

}