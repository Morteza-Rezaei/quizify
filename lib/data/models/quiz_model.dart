class QuizQuestion {
  final String question;
  final List<String> answers;
  final int correctAnswerIndex;

  QuizQuestion({
    required this.question,
    required this.answers,
    required this.correctAnswerIndex,
  });
}

class Quiz {
  final List<QuizQuestion> questions;

  Quiz({required this.questions});
}
