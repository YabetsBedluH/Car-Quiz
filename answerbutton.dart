import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Answerbutton extends StatelessWidget {
  const Answerbutton(
      {required this.answertext, required this.ontap, super.key});

  final void Function() ontap;

  final String answertext;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 40),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          foregroundColor: const Color.fromARGB(95, 255, 5, 5)),
      child: Text(
        answertext,
        style: GoogleFonts.lateef(fontSize: 23),
        textAlign: TextAlign.center,
      ),
    );
  }
}
