import 'package:fifth_app/data/questionss.dart';
import 'package:fifth_app/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:fifth_app/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fifth_app/connect.dart';

class Resultpage extends StatelessWidget {
  const Resultpage({super.key, required this.selectedanswer});

  final List<String> selectedanswer;

  List<Map<String, Object>> getsummarydata() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedanswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].images,
        'correct_answer': questions[i].answers![0],
        'user_answer': selectedanswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getsummarydata();
    final numtotalquestions = questions.length;
    final numcorrectquestions = summarydata.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 32, 65, 38),
        Color.fromARGB(255, 0, 0, 0)
      ])),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'you have answerd $numcorrectquestions out of $numtotalquestions questions ',
                style: GoogleFonts.lora(
                    color: const Color.fromARGB(196, 255, 0, 0), fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionsSummary(summarydata),
              const SizedBox(
                height: 50,
              ),
              /*  OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'Restart quiz',
                  style: TextStyle(color: Color.fromARGB(248, 255, 0, 0)),
                ),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
