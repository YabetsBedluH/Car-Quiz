import 'package:fifth_app/data/questionss.dart';
import 'package:fifth_app/landing_page.dart';
import 'package:fifth_app/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:fifth_app/play_page.dart';
import 'package:google_fonts/google_fonts.dart';

class Connect extends StatefulWidget {
  const Connect({super.key});
  @override
  State<Connect> createState() {
    return _Connecting();
  }
}

class _Connecting extends State<Connect> {
  List<String> choosenanswer = [];
  var activescreen = 'start-page';

  void switchScreen() {
    setState(() {
      activescreen = 'second-page';
    });
  }

  void lastpage() {
    setState(() {
      activescreen = 'last-page';
    });
  }

  void selectedanswers(answers) {
    choosenanswer.add(answers);
    if (choosenanswer.length == questions.length) {
      setState(() {
        activescreen = 'results-page';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenwidget = LandingPage(
      switchScreen,
      title: 'hello',
    );
    if (activescreen == 'second-page') {
      screenwidget = PlayPage(onpressed: selectedanswers);
    }

    if (activescreen == 'results-page') {
      screenwidget = Resultpage(
        selectedanswer: choosenanswer,
      );
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 32, 65, 38),
            title: Center(
              child: Text(
                "YABU'S CAR QUIZ",
                style: GoogleFonts.lateef(
                  fontSize: 30,
                  color: const Color.fromARGB(167, 253, 6, 6),
                ),
              ),
            ),
          ),
          body: screenwidget,
          drawer: Drawer(
            child: Container(
              color: const Color.fromARGB(255, 0, 0, 0),
              child: const Center(
                child: Text(
                  'PROUDLY BUILT BY YABETS BEDLU',
                  style: TextStyle(color: Color.fromARGB(197, 237, 18, 3)),
                ),
              ),
            ),
          ),
        ));
  }
}
