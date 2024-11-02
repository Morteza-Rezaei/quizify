class QuizOptions {
  final String subject;
  final List<String> selectedTopics;
  final String level;
  final String quizNumber;
  final String quizType;

  QuizOptions({
    required this.subject,
    required this.selectedTopics,
    required this.level,
    required this.quizNumber,
    required this.quizType,
  });

  Map<String, dynamic> toJson() {
    return {
      'Ders': subject,
      'Seçilen Konular': selectedTopics,
      'Zorluk Seviyesi': level,
      'Soru Sayısı': quizNumber,
      'Soru Türü': quizType,
    };
  }
}
