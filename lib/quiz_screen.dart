import 'package:flutter/material.dart';
import 'package:mitos_paraguay/answer_card.dart';
import 'package:mitos_paraguay/questionsmain.dart';
import 'package:mitos_paraguay/question.dart';
import 'package:mitos_paraguay/next_button.dart';
import 'package:mitos_paraguay/result_screen.dart';


class QuizScreen extends StatefulWidget{
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>{
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    final question = questions[questionIndex];
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      score++;
    }
    setState(() {});
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context){
    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;
    //final question = questions[0];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 0, 50, 0.9),
        title: const Text(
            "Mitos de Yaguarón",
            style: TextStyle(
              height: 5,
              color: Color.fromRGBO(179, 255, 151, 0.8),
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
              fontSize: 27,
            )
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Changes the back button color
        ),
        centerTitle: true,
      ),
      backgroundColor:const Color.fromRGBO(204, 255, 204, 1),


      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              question.question,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            ListView.builder(
                //padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                itemCount: question.options.length,
                itemBuilder:(context, index){
                  return GestureDetector(
                      onTap: selectedAnswerIndex == null
                          ? () => pickAnswer(index)
                          : null,

                        child: AnswerCard(
                        currentIndex: index,
                          question: question.options[index],
                          isSelected: selectedAnswerIndex == index,
                          selectedAnswerIndex:selectedAnswerIndex,
                          correctAnswerIndex: question.correctAnswerIndex,
                        )

                  );
                }),
            isLastQuestion
                ? RectangularButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => ResultScreen(
                      score: score,
                    ),
                  ),
                );
              },
              label: 'Terminar',
            )
                : RectangularButton(
              onPressed:

                selectedAnswerIndex != null ? goToNextQuestion : null,
              label: 'Próximo',
            ),
          ],
        ),
      ),
    );
    }
}