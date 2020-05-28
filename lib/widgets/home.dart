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
bool genre = false;
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

  Widget switchSelonPlatforme(){
    if(Platform.isIOS){
      new CupertinoSwitch(value: genre, onChanged: (bool b){
        setState(() {
          genre =b;
        });
      });
    }else{
      new Switch(
          value: genre,
          inactiveTrackColor: Colors.pink,
          activeTrackColor:  Colors.blue,
          onChanged: (bool b){
            setState(() {
              genre =b;
            });
          });
    }
  }

  Widget textavecstyle(String data, color, {fontSize : 15.0}){
    if(Platform.isIOS){
      return new DefaultTextStyle(
        style: new TextStyle(
            color: color,
            fontSize: fontSize),
        child: new Text(data,
        textAlign: TextAlign.center,style: new TextStyle(
            color: color,
            fontSize: fontSize
          ),));
    }else{
      return new Text(data,
          style: new TextStyle(
              color: color,
              fontSize: fontSize
          ));
    }
  }
}