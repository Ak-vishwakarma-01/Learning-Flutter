import 'package:ab_quiz_apps/data/questions.dart';
import 'package:ab_quiz_apps/question_screen.dart';
import 'package:ab_quiz_apps/results_screen.dart';
import 'package:ab_quiz_apps/start_creen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz>{

  /*
  // variable to switch the screen
  Widget? activeScreen ;

 // this will run during the initialization of Quiz class befor the build method;
  @override
  void initState() {  
    activeScreen = StartScreen(changeScreen); // if we pass changeScreen() then it will run the function otherwise we are just giving the pointer to that function
    super.initState();
  }
  

  // changint the screen here
  void changeScreen() {            
    setState(() {
      activeScreen = const QuestionScreen();
    });
  }
  */

  List<String> selectedAnswer = [];

  var activeScreen = 'startscreen';
  void changeScreen(){
    setState(() {
      activeScreen = 'questionscreen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswer.add(answer);
    if(selectedAnswer.length==questions.length){
      setState(() {
      activeScreen = 'resultscreen';
      });
    }
  }

  void onRestartQuiz(){
    setState((){
      selectedAnswer  = [];
      activeScreen = 'questionscreen';
    });
  }

@override
  Widget build(context) {
    Widget screenWidget = StartScreen(changeScreen);

    if(activeScreen=='questionscreen'){
      screenWidget = QuestionScreen(onselectedAnswer: chooseAnswer,);
    }
   
    if(activeScreen=='resultscreen'){ 
      screenWidget = ResultsScreen(onRestartQuiz, chooseAnswer: selectedAnswer,);
    }

    return MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 6, 56, 83),
              Color.fromARGB(255, 20, 113, 150)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
      ),
      
        // which scree would be shown
        child: screenWidget  ,   
      ),
    ),
   );
  }

}