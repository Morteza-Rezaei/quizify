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

  final prompt = """
  ${quizOptions.quizNumber} tane quiz sorusu oluşturun.
  Ders: ${quizOptions.subject},
  Seçilen Konular: ${quizOptions.selectedTopics},
  Zorluk Seviyesi: ${quizOptions.level},
  Soru Türü: ${quizOptions.quizType},

  Çıktı formatı:
  Her soru aşağıdaki JSON formatında olmalıdır:
  {
    "question": string,
    "answers": list[string],
    "correctAnswerIndex": int
  }

  Kurallar:
  1. Sorular ${quizOptions.quizType} formatına uygun olmalı, yani ${quizOptions.quizType} türüne göre doğru cevap sayısını belirleyin.
  2. "question": değeri string tipinde bir soru cümlesi olmalı.
  3. "answers": sorunun cevapları string tipinde bir liste olmalı. Cevap sayısı ${quizOptions.quizType} türüne göre değişebilir. ve listedeki ilk elemanın indexi 0'dır.
  4. "correctAnswerIndex" değeri bir tam sayı olmalı ve "answers" listesindeki doğru cevabın indexini belirtmelidir. Index 0'dan başlar.
  
  Örnek:
  girdiler:
  ${quizOptions.quizNumber} = 2
  ${quizOptions.subject} = "Matematik"
  ${quizOptions.selectedTopics} = ["Toplama", "Çıkarma"]
  ${quizOptions.level} = "Orta"
  ${quizOptions.quizType} = "Test (4 şık)"
  çıktı:
  [
    {
      "question": "2 + 2 kaçtır?",
      "answers": ["3", "4", "5", "6"],
      "correctAnswerIndex": 1
    },
    {
      "question": "5 - 3 kaçtır?",
      "answers": ["2", "3", "4", "5"],
      "correctAnswerIndex": 0
    }
  ]
  """;

  final response = await model.generateContent([
    Content.multi([
      TextPart(prompt),
    ])
  ]);

  print("response: ${response.text}");

  return response.text!;
}
