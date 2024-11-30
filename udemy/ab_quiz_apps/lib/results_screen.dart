import 'package:ab_quiz_apps/data/questions.dart';
import 'package:ab_quiz_apps/questions_summary.dart';
import 'package:ab_quiz_apps/styled_text.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.onRestart, {super.key, required this.chooseAnswer,}); // if you pass this.onRestart then it will not work

  final void Function() onRestart;
  final List<String> chooseAnswer;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < chooseAnswer.length; i++) {
      summary.add({
        'question-index': i,
        'question': questions[i].text,
        'correct-answer': questions[i].answers[0],
        'user-answer': chooseAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var summaryData = getSummary();
    final totalData = summaryData.length;
    final correctData =
        summaryData.where((data) => data['user-answer'] == data['correct-answer']).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledText(
                'You got $correctData out of $totalData ', 30,
                const Color.fromARGB(255, 232, 160, 160)),
            const SizedBox(height: 20),
            QuestionsSummary(summaryData),
            const SizedBox(height: 20),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 19, 80, 141),
              ),
              onPressed: onRestart,   // we pass the fuctionthen we dont need to write inside this () {} othterwise it will not work
              child: const StyledText('Restart Quiz', 30, Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}