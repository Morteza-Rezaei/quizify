import 'package:flutter/material.dart';
import 'package:quizify/data/models/subject_model.dart';

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
        title: Text(widget.subject.name),
      ),
      body: ListView.builder(
        itemCount: widget.subject.topics.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(widget.subject.topics[index]),
            onTap: () {},
          );
        },
      ),
    );
  }
}
