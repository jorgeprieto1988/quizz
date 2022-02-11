import 'package:flutter/material.dart';

class Settings {
  int numberQuestion;
  String difficulty;
  int questionCounter;
  int correctQuestions;

  Settings(
      {@required this.numberQuestion,
      @required this.difficulty,
      @required this.questionCounter,
      @required this.correctQuestions});

  int getNumberQuestion() {
    return this.numberQuestion;
  }

  void setNumberQuestion(int numberQuestion) {
    this.numberQuestion = numberQuestion;
  }

  int getquestionCounter() {
    return this.questionCounter;
  }

  void setquestionCounter(int questionCounter) {
    this.questionCounter = questionCounter;
  }

  int getcorrectQuestions() {
    return this.correctQuestions;
  }

  void setcorrectQuestions(int correctQuestions) {
    this.correctQuestions = correctQuestions;
  }

  String getDifficulty() {
    return this.difficulty;
  }

  void setDifficulty(String difficulty) {
    this.difficulty = difficulty;
  }
}
