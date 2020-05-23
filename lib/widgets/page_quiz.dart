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
    new Question('La devise de la Belgique est l\'union fait la force ?', true, '', "belgique.jpg"),
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

  @override
  void initState() {
    super.initState();
    question = listeQuestion[index];
  }

  @override
  Widget build(BuildContext context) {
    double taille = MediaQuery.of(context).size.width * 0.75;
    return new Scaffold(
      appBar: new AppBar(
        title: new CustomText('Le Quiz'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new CustomText("Question numero ${index+1}", color: Colors.grey[900]),
            new CustomText("Score: $score / $index", color: Colors.grey[900],),
            new Card(
              elevation: 10.0,
              child: new Container(
                height: taille,
                width: taille,
                child: new Image.asset(
                  "quiz assets/${question.imagePath}",
                  fit: BoxFit.cover ,
                ),
              ),
            ),
            new CustomText(question.question ,color: Colors.grey[900], factor: 1.3),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                boutonBool(true),
                boutonBool(false)
              ],
            )
          ],
        ),
      ),
    );
  }
  RaisedButton boutonBool (bool b){
    return new RaisedButton(
      elevation: 10.0,
      onPressed: (() => dialogue(b)),
      color: Colors.blue,
      child: new CustomText((b)? "Vrai":"Faux", factor: 1.25),
    );
  }

  Future<Null> dialogue (bool b) async{
    bool bonneReponse = (b == question.reponse);
    String vrai = "quiz assets/vrai.jpg";
    String faux = "quiz assets/faux.jpg";
    if(bonneReponse){
      score++;
    }
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return new SimpleDialog(
            title: new CustomText((bonneReponse)? "C'est gagné!!!!" : "Oups perdu..."),
            contentPadding: EdgeInsets.all(20.0),
            children: <Widget>[
              new Image.asset((bonneReponse)? vrai : faux, fit :BoxFit.cover),
              new Container(height: 25.0),
              new CustomText(question.explication, factor: 1.25, color: Colors.grey[900]),
              new Container(height: 25.0),
              new RaisedButton(onPressed: () {
                Navigator.pop(context);
                questionSuivante();
              },
                child: new CustomText("Au suivant", factor: 1.25),
                color: Colors.blue,
              )
            ],
          );
        }
    );
  }
  Future<Null> alert() async{
    return showDialog(context: context,
        barrierDismissible: false,
        builder:( BuildContext buildeContext){
          return new AlertDialog(
            title: new CustomText("C'est fini", color: Colors.blue, factor: 1.25,),
            contentPadding: EdgeInsets.all(10.0),
            content: new CustomText("Votre score: $score / $index", color: Colors.grey[900]),
            actions: <Widget>[
              new FlatButton(
                  onPressed: (() {
                    Navigator.pop(buildeContext);
                    Navigator.pop(context);
                  }),
                  child: new CustomText("OK", factor: 1.25, color: Colors.blue))
            ],
          );
        }
    );

  }
  void questionSuivante(){
    if(index < listeQuestion.length-1){
      index++;
      setState(() {
        question = listeQuestion[index];
      });
    }else{
      alert();
    }
  }
}