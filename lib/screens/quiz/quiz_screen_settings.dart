// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizify/constants/padding_and_border/paddings.dart';
import 'package:quizify/constants/values/paths/quiz_path.dart';
import 'package:quizify/constants/values/strings/quiz_text.dart';
import 'package:quizify/data/models/quiz_model.dart';
import 'package:quizify/data/models/quiz_options.dart';
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

  // Helper method to get the selected option text
  String _getSelectedOptionText(List<String> options, int selectedIndex) {
    return selectedIndex >= 0 ? options[selectedIndex] : '';
  }

  bool _isLoading = false;

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
              child: _isLoading
                  ? loadingMini()
                  : ElevatedButton(
                      onPressed: () async {
                        if (_selectedTimerIndex == -1) {
                          showSnackBar(
                            context: context,
                            text: QuizText.timerError,
                          );
                          return;
                        }
                        if (_selectedLevelIndex == -1) {
                          showSnackBar(
                            context: context,
                            text: QuizText.levelError,
                          );
                          return;
                        }
                        if (_selectedQuizNumberIndex == -1) {
                          showSnackBar(
                            context: context,
                            text: QuizText.quizNumberError,
                          );
                          return;
                        }
                        if (_selectedQuizTypeIndex == -1) {
                          showSnackBar(
                            context: context,
                            text: QuizText.quizTypeError,
                          );
                          return;
                        } else {
                          setState(() {
                            _isLoading = true;
                          });
                          // now we have all the quiz options and ready to create the quiz via gemini :)

                          // Create the QuizOptions object
                          QuizOptions quizOptions = QuizOptions(
                            subject: widget.subject.name,
                            selectedTopics: widget.selectedTopics,
                            level: _getSelectedOptionText([
                              QuizText.levelOption1,
                              QuizText.levelOption2,
                              QuizText.levelOption3
                            ], _selectedLevelIndex),
                            quizNumber: _getSelectedOptionText([
                              QuizText.quizNumberOption1,
                              QuizText.quizNumberOption2,
                              QuizText.quizNumberOption3,
                              QuizText.quizNumberOption4
                            ], _selectedQuizNumberIndex),
                            quizType: _getSelectedOptionText([
                              QuizText.quizTypeOption1,
                              QuizText.quizTypeOption2,
                              QuizText.quizTypeOption3
                            ], _selectedQuizTypeIndex),
                          );

                          try {
                            Quiz quiz = await fetchQuizData(
                              quizOptions,
                              context,
                            );
                            print(jsonEncode(quiz));

                            // // if there is an error, show the error dialog and on submit try again
                            // quizWarningAlertDialog(
                            //   context: context,
                            //   imagePath: QuizPath.error,
                            //   title: QuizText.quizError,
                            //   content: QuizText.quizErrorMessage,
                            //   filledBtnName: QuizText.quizErrorButton,
                            //   onFilledBtnPressed: () {},
                            // );

                            // the timer selection
                            Duration selectedDuration;
                            switch (_selectedTimerIndex) {
                              case 0:
                                selectedDuration = const Duration(minutes: 5);
                                break;
                              case 1:
                                selectedDuration = const Duration(minutes: 10);
                                break;
                              case 2:
                                selectedDuration = const Duration(minutes: 15);
                                break;
                              // although it is not possible to reach here, we set a default value
                              default:
                                selectedDuration = const Duration(minutes: 60);
                            }

                            setState(() {
                              _isLoading = false;
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizScreenStartScreen(
                                  quiz: quiz,
                                  timerDuration: selectedDuration,
                                ),
                              ),
                            );
                          } catch (e) {
                            setState(() {
                              _isLoading = false;
                            });

                            // print(
                            //     "fetchQuizData error from setting screen: $e");
                            throw Exception(
                                "fetchQuizData error from setting screen: $e");
                          }
                        }
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
