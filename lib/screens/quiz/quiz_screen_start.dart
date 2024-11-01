import 'package:flutter/material.dart';
import 'package:quizify/constants/padding_and_border/border_radius.dart';
import 'package:quizify/constants/padding_and_border/paddings.dart';
import 'package:quizify/constants/values/colors/app_colors.dart';
import 'package:quizify/data/models/quiz_model.dart';
import 'package:quizify/screens/quiz/quiz_result_screen.dart';
import 'package:quizify/widgets/app_widgets.dart';
import 'package:quizify/widgets/quiz_widgets.dart';

class QuizScreenStartScreen extends StatefulWidget {
  const QuizScreenStartScreen({super.key, required this.quiz});

  final Quiz quiz;
  @override
  State<QuizScreenStartScreen> createState() => _QuizScreenStartScreenState();
}

class _QuizScreenStartScreenState extends State<QuizScreenStartScreen> {
  int soruNo = 0;
  int selectedAnswer = -1;
  List<int> userAnswers = [];

  @override
  Widget build(BuildContext context) {
    int soruSayisi = widget.quiz.questions.length;
    final currentQuestion = widget.quiz.questions[soruNo];

    return Scaffold(
      appBar: AppBar(
        leading: backButton(context),
        title: Column(
          children: [
            Text(
              'Soru $soruNo/$soruSayisi',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            // the progress bar
            const SizedBox(
              height: kInBetweenSpacing,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
              height: 4,
              width: double.infinity,
              child: LinearProgressIndicator(
                value: soruNo / soruSayisi,
                backgroundColor: AppColors.primary90,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.primary50,
                ),
                borderRadius: BorderRadius.circular(kCardBorderRadius),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: kHorizontalPadding,
            ),
            child: Text(
              '00:00',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.red,
                  ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // the header of the quiz page
            quizQuestion(
              context: context,
              questionIndex: soruNo + 1,
              question: currentQuestion.question,
            ),

            ...currentQuestion.answers.asMap().entries.map(
              (entry) {
                int idx = entry.key;
                // show the 2 answers
                String answer = entry.value;
                return answerCard(
                  context: context,
                  leadingLetter: '${String.fromCharCode(65 + idx)}:',
                  answer: answer,
                  isSelected: selectedAnswer == idx,
                  onTap: () {
                    setState(() {
                      selectedAnswer = idx;
                    });
                  },
                );
              },
            ),

            // the next button
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: kVericalPadding,
              ),
              child: ElevatedButton(
                onPressed: () {
                  // user must select an answer
                  if (selectedAnswer == -1) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Lütfen bir şık seçiniz',
                        ),
                      ),
                    );
                    return;
                  }
                  // save the answer
                  userAnswers.add(selectedAnswer);
                  // go to the next question
                  if (soruNo < soruSayisi - 1) {
                    setState(() {
                      soruNo++;
                      selectedAnswer = -1;
                    });
                  } else {
                    // show the result page
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return QuizResultScreen(
                        quiz: widget.quiz,
                        userAnswers: userAnswers,
                      );
                    }));
                  }
                },
                child: const Text(
                  'Sonraki Soru',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}