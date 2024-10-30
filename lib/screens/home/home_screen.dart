import 'package:flutter/material.dart';
import 'package:quizify/data/subject_data.dart';
import 'package:quizify/widgets/home_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // the header elements of the home screen (title, description, avatar)
            homeScreenHeader(context: context),
            // show the list of subjects
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (BuildContext context, int index) {
                  return subjectCard(
                    context: context,
                    subject: subjects[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
