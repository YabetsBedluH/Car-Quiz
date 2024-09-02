import 'package:flutter/material.dart';
//import 'package:fifth_app/connect.dart';
import 'package:fifth_app/answerbutton.dart';
import 'package:fifth_app/data/questionss.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({required this.onpressed, super.key});
  final void Function(String answers) onpressed;

  @override
  State<StatefulWidget> createState() {
    return _Playpage();
  }
}

class _Playpage extends State<PlayPage> {
  var currentquestionindex = 0;

  void answerquestion(String choosenaanswer) {
    widget.onpressed(choosenaanswer);
    //this add one or increment 1
    setState(() {
      currentquestionindex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentquestion = questions[currentquestionindex];
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 32, 65, 38),
          Color.fromARGB(255, 0, 0, 0)
        ], begin: Alignment.bottomRight, end: Alignment.topLeft),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                currentquestion.images,
                width: 500,
                height: 400,
                // style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              ...currentquestion.shuffledlist()!.map((item) {
                return Answerbutton(
                  answertext: item,
                  ontap: () {
                    answerquestion(item);
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
