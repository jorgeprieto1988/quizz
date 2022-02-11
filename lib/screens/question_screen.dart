import 'package:ejercicio3/model/settings.dart';
import 'package:flutter/material.dart';
import 'package:ejercicio3/widgets/question_widget.dart';

// This is the third screen, it calls question widget that returns the question from an API

class QuestionScreen extends StatelessWidget {
  final Settings settings;
  QuestionScreen({Key key, @required this.settings}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Question ' +
              settings.getquestionCounter().toString() +
              " of " +
              settings.getNumberQuestion().toString()),
        ),
        body: QuestionWidget(
          settings: settings,
        ),
      ),
    );
  }
}
