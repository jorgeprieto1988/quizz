import 'package:flutter/material.dart';
import 'dart:convert';

class Question {
  String questionText;
  String correctAnswer;
  String incorrectAnswer;

  Question({@required this.questionText, @required this.correctAnswer});

  factory Question.fromJson(Map<String, dynamic> json) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return Question(
      questionText: stringToBase64.decode(json['results'][0]['question']),
      correctAnswer:
          stringToBase64.decode(json['results'][0]['correct_answer']),
    );
  }
}
