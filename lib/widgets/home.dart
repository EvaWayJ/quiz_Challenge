import 'package:flutter/material.dart';
import 'package:quizchallenge/widgets/custom_text.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
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
                onPressed: () {},
            child: new CustomText("Commencer le quiz", factor: 1.5)
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}