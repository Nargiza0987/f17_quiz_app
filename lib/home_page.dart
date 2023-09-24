import 'package:f17_quiz_app/widget/drawer.dart';
import 'package:f17_quiz_app/widget/quiz_button.dart';
import 'package:f17_quiz_app/widget/result_icon.dart';
import 'package:flutter/material.dart';
 
import 'model/quiz_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
} 

class _HomePageState extends State<HomePage> {
  int index = 0;
  List answer = <bool>[];
  List answerTrue = <bool>[];
  List answerFalse = <bool>[];
  void check(bool value) {
    if (quizzes[index].answer == value) {
      answer.add(true);
      answerTrue.add(true);
    } else {
      answer.add(false);
      answerFalse.add(false);
    }
    setState(() {
      // setState UI ды жанылаш учун коёбуз
      if (quizzes[index] == quizzes.last) {
        index = 0;
        showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              title: Text('Сиз бул тесттен'),
              content: Text(
                  '${answerTrue.length} туура жооп, ${answerFalse.length} ката жооп бердиниз!'),
            );
          }),
        );
        answer.clear();
      } else {
        index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drivers(),
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Тапшырма - 07',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              quizzes[index].question,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 45,
              ),
            ),
            Spacer(),
            QuizButton(
              isTrue: true,
              onPressed: (value) {
                check(value);
              },
            ),
            SizedBox(height: 20),
            QuizButton(
              isTrue: false,
              onPressed: (value) {
                check(value);
              },
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: answer.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int i) {
                  return answer[i] ? ResultIcon(true) : ResultIcon(false);
                },
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
