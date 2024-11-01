import 'package:flutter/material.dart';
import 'package:quizify/constants/padding_and_border/paddings.dart';
import 'package:quizify/constants/values/paths/quiz_path.dart';
import 'package:quizify/constants/values/strings/quiz_text.dart';
import 'package:quizify/data/models/quiz_model.dart';
import 'package:quizify/widgets/quiz_widgets.dart';

class QuizResultScreen extends StatefulWidget {
  const QuizResultScreen({
    super.key,
    required this.quiz,
    required this.userAnswers,
  });

  final Quiz quiz;
  final List<int> userAnswers;

  @override
  State<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> {
  // the user's score by 100 percent
  int score = 0;

  // the number of correct answers
  int correctAnswers = 0;

  // the number of wrong answers
  int wrongAnswers = 0;

  void calculateResults() {
    for (int i = 0; i < widget.quiz.questions.length; i++) {
      if (widget.quiz.questions[i].correctAnswerIndex ==
          widget.userAnswers[i]) {
        correctAnswers++;
      } else {
        wrongAnswers++;
      }
    }
    score = ((correctAnswers / widget.quiz.questions.length) * 100).toInt();
  }

  @override
  void initState() {
    super.initState();
    calculateResults();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            quizBigHeader(
              context: context,
              title: QuizText.resultHeader,
            ),
            threeCardsRow(
              context: context,
              imageWidth: 50,
              imageHeight: 50,
              isActive: -1,
              imagePath1: QuizPath.score,
              title1: '$score / 100',
              onTap1: () {},
              imagePath2: QuizPath.correct,
              title2: '$correctAnswers Doğru',
              onTap2: () {},
              imagePath3: QuizPath.wrong,
              title3: '$wrongAnswers Yanlış',
              onTap3: () {},
            ),
            const SizedBox(
              height: kVericalPadding * 2,
            ),
            titleAndDescription(
              context: context,
              title: QuizText.resultTitle,
              description: QuizText.resultDescription,
            ),
            // the list of questions and answers
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: kInBetweenSpacing,
                  right: kInBetweenSpacing,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      List.generate(widget.quiz.questions.length, (index) {
                    final question = widget.quiz.questions[index];
                    final userAnswer = widget.userAnswers[index];
                    final isCorrect = question.correctAnswerIndex == userAnswer;
                    return resultCard(
                      context: context,
                      questionNo: index + 1,
                      question: question.question,
                      isCorrect: isCorrect,
                      leadingLetter:
                          '${String.fromCharCode(65 + question.correctAnswerIndex)}:',
                      answer: question.answers[question.correctAnswerIndex],
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: kVericalPadding * 2,
            ),
            threeCardsRow(
              context: context,
              imageWidth: 50,
              imageHeight: 50,
              isActive: -1,
              imagePath1: QuizPath.share,
              title1: QuizText.resultShareButton,
              onTap1: () {},
              imagePath2: QuizPath.tryAgain,
              title2: QuizText.resultRetryButton,
              onTap2: () {},
              imagePath3: QuizPath.home,
              title3: QuizText.resultHomeButton,
              onTap3: () {},
            ),
            const SizedBox(
              height: kVericalPadding * 2,
            ),
          ],
        ),
      ),
    );
  }
}
