import 'package:flutter/material.dart';
import 'package:quizify/constants/padding_and_border/paddings.dart';
import 'package:quizify/constants/values/paths/quiz_path.dart';
import 'package:quizify/constants/values/strings/quiz_text.dart';
import 'package:quizify/data/models/quiz_model.dart';
import 'package:quizify/screens/home/home_screen.dart';
import 'package:quizify/screens/quiz/quiz_screen_start.dart';
import 'package:quizify/widgets/quiz_widgets.dart';
import 'package:share_plus/share_plus.dart';

class QuizResultScreen extends StatefulWidget {
  const QuizResultScreen({
    super.key,
    required this.quiz,
    required this.userAnswers,
    required this.timerDuration,
  });

  final Quiz quiz;
  final List<int> userAnswers;
  final Duration timerDuration;

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
              onTap1: () {
                // for now we just simply share the results as text
                final StringBuffer shareContent = StringBuffer();
                shareContent.writeln('Merhaba! 🎉');
                shareContent.writeln(
                    '🚀Quizify uygulaması ile çözdüğüm quiz sonucunu paylaşıyorum. 🚀');
                shareContent.writeln('👐 Quiz Soncum 👐');
                shareContent.writeln('Toplam Skor: $score / 100 🎯');
                shareContent
                    .writeln('Bildiğin Soruların Sayısı: $correctAnswers 😎');
                shareContent
                    .writeln('Bilemediğin Soruların Sayısı: $wrongAnswers 😢');
                shareContent.writeln('\n👇 Sorular ve Cevaplar 👇\n');
                for (int i = 0; i < widget.quiz.questions.length; i++) {
                  final question = widget.quiz.questions[i];
                  final userAnswer = widget.userAnswers[i];
                  final isCorrect = question.correctAnswerIndex == userAnswer;
                  shareContent.writeln('Soru ${i + 1}: ${question.question}');
                  shareContent.writeln(
                      'Benim Cevabın: ${question.answers[userAnswer]}');
                  shareContent.writeln(
                      'Doğru Cevap: ${question.answers[question.correctAnswerIndex]}');
                  shareContent
                      .writeln('Sonuç: ${isCorrect ? 'Doğru' : 'Yanlış'}');
                  shareContent.writeln(
                      ''); // Boş bir satır ekleyerek sorular arasında boşluk bırakıyoruz
                }
                Share.share(shareContent.toString());
              },
              imagePath2: QuizPath.tryAgain,
              title2: QuizText.resultRetryButton,
              onTap2: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreenStartScreen(
                      quiz: widget.quiz,
                      timerDuration: widget.timerDuration,
                    ),
                  ),
                );
              },
              imagePath3: QuizPath.home,
              title3: QuizText.resultHomeButton,
              onTap3: () {
                // go to the home screen
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                  (route) => false,
                );
              },
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
