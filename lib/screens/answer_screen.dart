import 'package:ejercicio3/main.dart';
import 'package:ejercicio3/model/settings.dart';
import 'package:ejercicio3/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:ejercicio3/screens/question_screen.dart';

//This screen checks if the answer from the user is correct or not and it shows the result.
//If it is the last question it will call result screen, if not, it will call again question screen instead
class AnswerScreen extends StatelessWidget {
  final String userAnswer;
  final String correctAnswer;
  final String incorrectAnswer;
  final Settings settings;

  // In the constructor, require a Todo.
  AnswerScreen(
      {Key key,
      @required this.userAnswer,
      @required this.correctAnswer,
      @required this.incorrectAnswer,
      @required this.settings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Answer"),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              textResult(),
              Text(
                "Correct answer is",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                correctAnswer,
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              ButtonTheme(
                minWidth: 200.0,
                height: 150.0,
                child: RaisedButton(
                  color: Colors.blue,
                  shape: CircleBorder(),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => buttonNext()),
                    );
                  },
                  child: Text(
                    getbuttonText(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              buttonGoMain(context)
            ])));
  }

  Widget textResult() {
    settings.setquestionCounter(settings.getquestionCounter() + 1);
    if (userAnswer == correctAnswer) {
      settings.setcorrectQuestions(settings.getcorrectQuestions() + 1);
      return Container(
          decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(width: 4.0, color: Colors.green)),
          child: Text(
            "Congratulations you have answered correctly!",
            style: TextStyle(fontSize: 30, color: Colors.white),
            textAlign: TextAlign.center,
          ));
    } else {
      return Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 241, 47, 13),
              border: Border.all(
                  width: 10.0, color: Color.fromARGB(255, 241, 47, 13))),
          child: Text(
            "Sorry, that is not the correct answer",
            style: TextStyle(fontSize: 30, color: Colors.white),
            textAlign: TextAlign.center,
          ));
    }
  }

  Widget buttonNext() {
    if (settings.getquestionCounter() > settings.getNumberQuestion()) {
      return ResultScreen(settings: settings);
    } else {
      return QuestionScreen(settings: settings);
    }
  }

  String getbuttonText() {
    if (settings.getquestionCounter() > settings.getNumberQuestion()) {
      return "Results";
    } else {
      return "Next question";
    }
  }

  Widget buttonGoMain(BuildContext context) {
    return ButtonTheme(
      minWidth: 100.0,
      height: 75.0,
      child: FlatButton(
        color: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        },
        child: Text(
          "Go to Main Menu",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
