import 'package:flutter/material.dart';
import 'package:quizify/constants/padding_and_border/paddings.dart';
import 'package:quizify/constants/values/strings/quiz_text.dart';
import 'package:quizify/data/models/subject_model.dart';
import 'package:quizify/screens/quiz/quiz_screen_settings.dart';
import 'package:quizify/widgets/app_widgets.dart';
import 'package:quizify/widgets/quiz_widgets.dart';

class QuizScreenTopicsScreen extends StatefulWidget {
  const QuizScreenTopicsScreen({
    super.key,
    required this.subject,
  });

  // for the subject details
  final Subject subject;

  @override
  State<QuizScreenTopicsScreen> createState() => _QuizScreenTopicsScreenState();
}

class _QuizScreenTopicsScreenState extends State<QuizScreenTopicsScreen> {
  List<String> selectedTopics = [];

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
              description: QuizText.selectSubjectDescription,
              imagePath: widget.subject.imagePath,
            ),

            // the list of topics
            quizTopicsList(
              topics: widget.subject.topics,
              selectedTopics: selectedTopics,
              onChanged: (isChecked, topic) {
                setState(() {
                  if (isChecked == true) {
                    // add topic if checked and not already in the list
                    if (!selectedTopics.contains(topic)) {
                      selectedTopics.add(topic);
                    }
                  } else {
                    // remove topic if unchecked
                    selectedTopics.remove(topic);
                  }
                });
              },
            ),

            // the continue button
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: kVericalPadding,
              ),
              child: ElevatedButton(
                onPressed: () {
                  // show a snackbar if no topic is selected
                  if (selectedTopics.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          QuizText.selectSubjectError,
                        ),
                      ),
                    );
                    return;
                  }
                  // navigate and pass the selected topics
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreenSettingsScreen(
                        selectedTopics: selectedTopics,
                        subject: widget.subject,
                      ),
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
