import 'package:flutter/material.dart';
import 'package:quizify/constants/padding_and_border/paddings.dart';
import 'package:quizify/constants/values/paths/quiz_path.dart';
import 'package:quizify/constants/values/strings/quiz_text.dart';
import 'package:quizify/data/models/quiz_model.dart';
import 'package:quizify/data/models/subject_model.dart';
import 'package:quizify/data/service/quiz_service.dart';
import 'package:quizify/screens/quiz/quiz_screen_start.dart';
import 'package:quizify/widgets/app_widgets.dart';
import 'package:quizify/widgets/quiz_widgets.dart';

class QuizScreenSettingsScreen extends StatefulWidget {
  const QuizScreenSettingsScreen({
    super.key,
    required this.selectedTopics,
    required this.subject,
  });

  // for the selected topics
  final List<String> selectedTopics;
  // for the subject details
  final Subject subject;

  @override
  State<QuizScreenSettingsScreen> createState() =>
      _QuizScreenSettingsScreenState();
}

class _QuizScreenSettingsScreenState extends State<QuizScreenSettingsScreen> {
  int _selectedTimerIndex = -1;
  int _selectedLevelIndex = -1;
  int _selectedQuizNumberIndex = -1;
  int _selectedQuizTypeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // the header of the quiz page
            quizHeader(
              context: context,
              title: widget.subject.name,
              description: QuizText.selectQuizOptionsDescription,
              imagePath: widget.subject.imagePath,
            ),

            // the Row of the timer selection
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // the timer selection
                quizOptionsTitle(
                  context: context,
                  title: QuizText.timerTitle,
                ),
                threeCardsRow(
                  context: context,
                  imageWidth: 50,
                  imageHeight: 50,
                  isActive: _selectedTimerIndex,
                  imagePath1: QuizPath.timerOption1,
                  title1: QuizText.timerOption1,
                  onTap1: () {
                    setState(() {
                      _selectedTimerIndex = 0;
                    });
                  },
                  imagePath2: QuizPath.timerOption2,
                  title2: QuizText.timerOption2,
                  onTap2: () {
                    setState(() {
                      _selectedTimerIndex = 1;
                    });
                  },
                  imagePath3: QuizPath.timerOption3,
                  title3: QuizText.timerOption3,
                  onTap3: () {
                    setState(() {
                      _selectedTimerIndex = 2;
                    });
                  },
                ),

                // the level selection
                quizOptionsTitle(
                  context: context,
                  title: QuizText.levelTitle,
                ),
                threeCardsRow(
                  context: context,
                  imageWidth: 70,
                  imageHeight: 30,
                  isActive: _selectedLevelIndex,
                  imagePath1: QuizPath.levelOption1,
                  title1: QuizText.levelOption1,
                  onTap1: () {
                    setState(() {
                      _selectedLevelIndex = 0;
                    });
                  },
                  imagePath2: QuizPath.levelOption2,
                  title2: QuizText.levelOption2,
                  onTap2: () {
                    setState(() {
                      _selectedLevelIndex = 1;
                    });
                  },
                  imagePath3: QuizPath.levelOption3,
                  title3: QuizText.levelOption3,
                  onTap3: () {
                    setState(() {
                      _selectedLevelIndex = 2;
                    });
                  },
                ),

                // the quiz count selection
                quizOptionsTitle(
                  context: context,
                  title: QuizText.quizNumberTitle,
                ),
                fourCardsInRow(
                  context: context,
                  isActive: _selectedQuizNumberIndex,
                  title1: QuizText.quizNumberOption1,
                  onTap1: () {
                    setState(() {
                      _selectedQuizNumberIndex = 0;
                    });
                  },
                  title2: QuizText.quizNumberOption2,
                  onTap2: () {
                    setState(() {
                      _selectedQuizNumberIndex = 1;
                    });
                  },
                  title3: QuizText.quizNumberOption3,
                  onTap3: () {
                    setState(() {
                      _selectedQuizNumberIndex = 2;
                    });
                  },
                  title4: QuizText.quizNumberOption4,
                  onTap4: () {
                    setState(() {
                      _selectedQuizNumberIndex = 3;
                    });
                  },
                ),

                // the quiz type selection
                quizOptionsTitle(
                  context: context,
                  title: QuizText.quizTypeTitle,
                ),
                threeCardsRow(
                  context: context,
                  imageWidth: 50,
                  imageHeight: 50,
                  isActive: _selectedQuizTypeIndex,
                  imagePath1: QuizPath.typeOption1,
                  title1: QuizText.quizTypeOption1,
                  onTap1: () {
                    setState(() {
                      _selectedQuizTypeIndex = 0;
                    });
                  },
                  imagePath2: QuizPath.typeOption2,
                  title2: QuizText.quizTypeOption2,
                  onTap2: () {
                    setState(() {
                      _selectedQuizTypeIndex = 1;
                    });
                  },
                  imagePath3: QuizPath.typeOption3,
                  title3: QuizText.quizTypeOption3,
                  onTap3: () {
                    setState(() {
                      _selectedQuizTypeIndex = 2;
                    });
                  },
                ),
              ],
            ),

            // the continue button
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: kVericalPadding,
              ),
              child: ElevatedButton(
                onPressed: () async {
                  // Todo: show a loading screen and generate the quiz via gemini api
                  // Todo: pass the selected options to the quiz and generate the quiz
                  // navigate to the quiz screen
                  // Fetch the quiz data
                  Quiz quiz = await fetchQuizData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreenStartScreen(quiz: quiz),
                    ),
                  );
                },
                child: const Text(
                  QuizText.selectSubjectButton,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
