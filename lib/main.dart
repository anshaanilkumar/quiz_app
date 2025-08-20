import 'package:flutter/material.dart';
import 'package:quizz/qsbank.dart';
import 'package:quizz/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizbank qsbank= Quizbank();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Quizapp()
    );
  }
}

class Quizapp extends StatelessWidget {
  const Quizapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Quizpage(),
      ),
    ),);
  }
}
class Quizpage extends StatefulWidget {
  const Quizpage({super.key});

  @override
  State<Quizpage> createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  List<Widget>Scorekeeper=[];

  void checkAns(bool userSelectAns){
    bool correct = qsbank.getAns();
    setState(() {
      if(qsbank.isFinished()==true){
        Alert(context: context,
        title: 'Finished',
        desc: 'You are completed successfully').show();
        qsbank.reset();
        Scorekeeper=[];
      }else{
        if(userSelectAns==correct){
          Scorekeeper.add(Icon(Icons.check,color: Colors.green,));
        }else{
          Scorekeeper.add(Icon(Icons.close,color: Colors.red,));
          qsbank.nextQs();
        }
      }

    });
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                qsbank.getQs(),
                // qsbank.questionList[questionNumber].questionText,textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25
              ),),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                   shape: RoundedRectangleBorder(
                     borderRadius: const BorderRadius.all(Radius.circular(8)),
                   ),
                ),
                onPressed: (){
               checkAns(true);


                }, child: Text("True",style: TextStyle(
              color: Colors.white, fontSize: 20
            ),)
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                onPressed: (){
                  checkAns(false);
                  // bool correct = qsbank.questionList[questionNumber].questionAnswer;
                  // bool correct = qsbank.getAns();
                  // if(correct==false){
                  //   print("you are right");
                  // }else{
                  //   print("you are wrong");
                  // }
                  // setState(() {
                  //   qsbank.nextQs();
                  //   //   Scorekeeper.add(Icon(Icons.check ,color: Colors.green,));
                  // });
                }, child: Text("False",style: TextStyle(
                color: Colors.white, fontSize: 20
            ),)
            ),
          ),
        ),
        Row(
          children: Scorekeeper
        )
      ],
    );
  }
}


