import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quizchallenge/widgets/home.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      print("Je suis sur Ios");
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Quiz vrai ou faux'),
    );
  }
}