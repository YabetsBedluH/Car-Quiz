import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  const LandingPage(this.startquiz, {super.key, required this.title});
  final void Function() startquiz;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 32, 65, 38),
            Color.fromARGB(255, 0, 0, 0)
          ], begin: Alignment.bottomRight, end: Alignment.topLeft),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title),
              const SizedBox(
                height: 40.0,
              ),
              Image.asset(
                'assets/cars/maincar.jpg',
                width: 400,
                height: 400,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                ' Car Quiz ',
                style: GoogleFonts.lora(
                    color: const Color.fromARGB(196, 255, 0, 0), fontSize: 25),
              ),
              const SizedBox(
                height: 30,
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    foregroundColor: const Color.fromARGB(95, 255, 5, 5)),
                onPressed: startquiz,
                label: Text(
                  style: GoogleFonts.lobsterTwo(
                    color: const Color.fromARGB(167, 253, 6, 6),
                    fontSize: 19,
                  ),
                  'Start',
                  textAlign: TextAlign.center,
                ),
                icon: const Icon(Icons.arrow_right_alt),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 180),
              ),
            ],
          ),
        ));
  }
}
