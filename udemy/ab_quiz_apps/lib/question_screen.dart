
import 'package:ab_quiz_apps/answer_buttons.dart';
import 'package:ab_quiz_apps/data/questions.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget{
  const QuestionScreen({super.key ,required this.onselectedAnswer});

  final void Function(String answer) onselectedAnswer;

  @override
  State<QuestionScreen> createState() {
   return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
 

  var currentQuestionIndex = 0;

  void  changeQuestionIndex(String selectedAnswer){
    widget.onselectedAnswer (selectedAnswer) ;   // widget is used to point parent class variables

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build( context) {
    
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, // it will take the whole scree
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin:const EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.center,
            child: Text(
              currentQuestion.text,
              // adding google fonts  , flutter pub add google_fonts
              style: const TextStyle(
                color: Color.fromARGB(255, 227, 140, 242),
                fontSize: 24, 
                fontFamily: 'Roboto',
                ),
              textAlign: TextAlign.center,   // text align in center
            ),
          ),
          const SizedBox(height: 30,),

          //The ... in Dart is called the spread operator, which allows you to expand a collection (like a list, set, or map) into a sequence of values.
            ...currentQuestion.suffeledAnswers().map((answer){ 
            return Container(
              margin: const EdgeInsets.symmetric(   // maringt o every answer;
                vertical: 10,
                horizontal: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,  // streching so it can take full horizantal length
                children: [
                  AnswerButtons(
                    answerText: answer,
                    onTap: () {
                      changeQuestionIndex(answer);   // canging the answer index while holding the ans also
                    },
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}