import 'package:ejercicio3/screens/answer_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ejercicio3/model/question.dart';
import 'package:ejercicio3/model/settings.dart';

//question_widget return the content of the question that gets from opentrivia API and constructs an UI from it
// it calls answer_screen
class QuestionWidget extends StatefulWidget {
  final Settings settings;
  QuestionWidget({Key key, @required this.settings}) : super(key: key);

  @override
  _QuestionWidget createState() {
    return new _QuestionWidget(settings: settings);
  }
}

class _QuestionWidget extends State<QuestionWidget> {
  final Settings settings;
  _QuestionWidget({Key key, @required this.settings});
  //final Question character;
  Future<Question> futureQuestion;
  //CharacterWidget({Key key, @required this.character}) : super(key: key);
  @override
  void initState() {
    super.initState();
    futureQuestion = fetchQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Question>(
        future: futureQuestion,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 400.0,
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black)),
                    child: Text(
                      snapshot.data.questionText,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ButtonTheme(
                    minWidth: 200.0,
                    height: 150.0,
                    child: RaisedButton(
                      color: Colors.green,
                      shape: CircleBorder(),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnswerScreen(
                                    userAnswer: "True",
                                    correctAnswer: snapshot.data.correctAnswer,
                                    incorrectAnswer:
                                        snapshot.data.incorrectAnswer,
                                    settings: settings,
                                  )),
                        );
                      },
                      child: Text(
                        'TRUE',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ButtonTheme(
                    minWidth: 200.0,
                    height: 150.0,
                    child: RaisedButton(
                      color: Colors.red,
                      shape: CircleBorder(),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnswerScreen(
                                    userAnswer: "False",
                                    correctAnswer: snapshot.data.correctAnswer,
                                    incorrectAnswer:
                                        snapshot.data.incorrectAnswer,
                                    settings: settings,
                                  )),
                        );
                      },
                      child: Text(
                        'FALSE',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ]);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Future<Question> fetchQuestion() async {
    var response = await http.get(
        'https://opentdb.com/api.php?amount=1&type=boolean&encode=base64&difficulty=' +
            settings.getDifficulty());
    if (response.statusCode == 200) {
      //var jsonResponse = convert.jsonDecode(response.body);
      //var questions = jsonResponse['results'];
      //return questions.toString();
      //return response.body.toString();
      return Question.fromJson(
          jsonDecode(response.body.replaceAll(r"&quot;", "'")));
    } else {
      throw Exception('Failed to load question');
    }
  }
}
