import 'package:flutter/material.dart';

class QuizScreenSettingsScreen extends StatelessWidget {
  const QuizScreenSettingsScreen({super.key, required this.selectedTopics});

  // for the selected topics
  final List<String> selectedTopics;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: selectedTopics.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(selectedTopics[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }
}
