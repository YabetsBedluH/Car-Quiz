import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.SummaryData, {super.key});

  final List<Map<String, Object>> SummaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: SummaryData.map(
            (data) {
              return Row(
                children: [
                  Text(((data['question_index'] as int) + 1,).toString(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 255, 26),
                      )),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(data['question'] as String),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: GoogleFonts.lora(
                              color: const Color.fromARGB(196, 17, 255, 0),
                              fontSize: 10),
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: GoogleFonts.lora(
                              color: const Color.fromARGB(196, 255, 0, 0),
                              fontSize: 10),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
