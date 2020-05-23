import 'package:flutter/material.dart';
import 'package:quizchallenge/widgets/custom_text.dart';

class PageQuiz extends StatefulWidget{
  @override
  _PageQuizState createState() => new _PageQuizState();

}

class _PageQuizState extends State<PageQuiz>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new CustomText('Le Quiz'),
      ),
      body: new Center(

      ),
    );
  }

}