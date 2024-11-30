class QuizQuestions {
  const QuizQuestions( this.text,this.answers);
 
  final String text;
  final List<String> answers;
 

  // suffeling thea answers
  List<String> suffeledAnswers(){
    final suffledList= List.of(answers);
    suffledList.shuffle();
    return suffledList;
  }

}