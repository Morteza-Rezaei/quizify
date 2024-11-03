// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:quizify/constants/values/paths/quiz_path.dart';
import 'package:quizify/constants/values/strings/quiz_text.dart';
import 'package:quizify/data/models/quiz_model.dart';
import 'package:quizify/data/models/quiz_options.dart';
import 'package:quizify/widgets/quiz_widgets.dart';

Future<Quiz> fetchQuizData(
    QuizOptions quizOptions, BuildContext context) async {
  try {
    final generatedQuizJson = await generateQuiz(quizOptions);
    final List<dynamic> questionsJson = jsonDecode(generatedQuizJson);
    final List<QuizQuestion> questions = questionsJson.map((questionJson) {
      return QuizQuestion(
        question: questionJson['question'],
        answers: List<String>.from(questionJson['answers']),
        correctAnswerIndex: questionJson['correctAnswerIndex'],
      );
    }).toList();

    return Quiz(questions: questions);
  } catch (e) {
    //print("fetchQuizData error: $e");
    quizWarningAlertDialog(
      context: context,
      imagePath: QuizPath.error,
      title: QuizText.quizError,
      content: QuizText.quizErrorMessage,
      filledBtnName: QuizText.quizErrorButton,
      onFilledBtnPressed: () {},
    );
    throw Exception("fetchQuizData error: $e");
  }
}

Future<String> generateQuiz(QuizOptions quizOptions) async {
  final model = GenerativeModel(
    model: 'gemini-1.5-pro',
    apiKey: 'AIzaSyD3wX0CDSQWap7-iGdzuEyYMbqoEPCLqE4',
    generationConfig: GenerationConfig(
      responseMimeType: 'application/json',
    ),
  );

  final prompt = """${quizOptions.quizNumber} tane quiz sorusu oluşturun.
  Ders: ${quizOptions.subject},
  Seçilen Konular: ${quizOptions.selectedTopics},
  Zorluk Seviyesi: ${quizOptions.level},
  Soru Türü: ${quizOptions.quizType},

  oluşturulacak sorular aşağıdaki json formatında olmalıdır:
  Örnek:
  {
    "question": string,
    "answers": list[string],
    "correctAnswerIndex": int
  }
  question: soru metni string tipinde olmalıdır.
  answers: sorunun cevapları string listesi olmalıdır ve Soru Türüne göre kaç adet olacağı belirlenir. ve listedeki ilk elemanın indexi 0'dır.
  correctAnswerIndex: doğru cevabın indexi olmalıdır ve integer tipinde olmalıdır. bu index answers listesindeki doğru cevabı belirtir. ve 0'dan başlar.
  """;

  final response = await model.generateContent([
    Content.multi([
      TextPart(prompt),
    ])
  ]);

  print("response: ${response.text}");

  return response.text!;
}
