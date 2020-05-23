import 'package:flutter/material.dart';
import 'package:quizchallenge/widgets/custom_text.dart';
import 'package:quizchallenge/models/question.dart';
class PageQuiz extends StatefulWidget{
  @override
  _PageQuizState createState() => new _PageQuizState();

}

class _PageQuizState extends State<PageQuiz>{

  Question question;

  List<Question> listeQuestion = [
    new Question("La devise de la Belgique est l'union fait la force ?", true, '', "belgique.jpg"),
    new Question("La lune va finir par tomber sur la terre a cause de la gravité", false, '', "lune.jpg"),
    new Question("La Russie est plus grande en superficie que pluton", true, '', "russie.jpg"),
    new Question("Nyctalope est une race naine d'antilope", false, '', "nyctalope.jpeg"),
    new Question("Le Commodore 64 est l'ordinateur de bureau le plus vendu", true, '', "commodore.jpg"),
    new Question("Le nom du drapeau des pirates est black skill", false, '', "pirate.jpg"),
    new Question("Haddock est le nom du chien de Tintin", false, '', "tintin.jpg"),
    new Question("La barbe des pharaons était fausse", true, '', "pharaon.jpg"),
    new Question("Au Quebec tire toi une buche veut dire viens t'assoir", true, '', "buche.jpg"),
    new Question("Le module Lunaire Eaglke ne possaidait que 4Ko de Ram", true, '', "eagle.jpg")
  ];
  int index = 0;
  int score =0;

  void initStates(){
    super.initState();
    question = listeQuestion[index];
  }
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