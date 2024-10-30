import 'package:flutter/material.dart';
import 'package:quizify/constants/padding_and_border/paddings.dart';
import 'package:quizify/constants/values/strings/quiz_text.dart';
import 'package:quizify/data/models/subject_model.dart';
import 'package:quizify/widgets/app_widgets.dart';
import 'package:quizify/widgets/quiz_widgets.dart';

class QuizScreenTopicsScreen extends StatefulWidget {
  const QuizScreenTopicsScreen({
    super.key,
    required this.subject,
  });

  final Subject subject;

  @override
  State<QuizScreenTopicsScreen> createState() => _QuizScreenTopicsScreenState();
}

class _QuizScreenTopicsScreenState extends State<QuizScreenTopicsScreen> {
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
              onChanged: (value) {},
            ),

            // the continue button
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: kVericalPadding,
              ),
              child: ElevatedButton(
                onPressed: () {},
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
