import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizchallenge/widgets/custom_text.dart';
import 'package:quizchallenge/widgets/page_quiz.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS)
    ? new CupertinoPageScaffold(
        navigationBar: new CupertinoNavigationBar(
        ),
        child: body())
        :Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: body() // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget body (){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Card(
            elevation: 10.0,
            child: new Container(
                height: MediaQuery.of(context).size.width * 0.8,
                width: MediaQuery.of(context).size.width * 0.8,
                child: new Image.asset("quiz assets/cover.jpg",
                    fit: BoxFit.cover
                )
            ),
          ),
          new RaisedButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (BuildContext context) {
                      return new PageQuiz();
                    }));
              },
              child: new CustomText("Commencer le quiz", factor: 1.5)
          )
        ],
      ),
    );
  }
}