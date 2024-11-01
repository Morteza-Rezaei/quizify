import 'package:quizify/data/models/quiz_model.dart';

Future<Quiz> fetchQuizData() async {
  // Implement the logic to fetch and generate the quiz data using the Gemini API
  // For now, let's return a dummy quiz
  return Quiz(
    questions: [
      QuizQuestion(
        question: 'What is the capital of France?',
        answers: ['Paris', 'London', 'Berlin', 'Madrid'],
        correctAnswerIndex: 0,
      ),
      QuizQuestion(
        question: 'What is 2 + 2?',
        answers: ['3', '4', '5', '6'],
        correctAnswerIndex: 1,
      ),
      QuizQuestion(
        question: 'What is the capital of Spain?',
        answers: ['Paris', 'London', 'Berlin', 'Madrid'],
        correctAnswerIndex: 3,
      ),
    ],
  );
}
