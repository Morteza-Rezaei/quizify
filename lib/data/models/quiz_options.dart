class QuizOptions {
  final List<String> selectedTopics;
  final String timer;
  final String level;
  final String quizNumber;
  final String quizType;

  QuizOptions({
    required this.selectedTopics,
    required this.timer,
    required this.level,
    required this.quizNumber,
    required this.quizType,
  });

  Map<String, dynamic> toJson() {
    return {
      'selectedTopics': selectedTopics,
      'timer': timer,
      'level': level,
      'quizNumber': quizNumber,
      'quizType': quizType,
    };
  }
}
