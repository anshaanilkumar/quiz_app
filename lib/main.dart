import 'package:flutter/material.dart';

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
  List<String>Questions=[
    'Is the Earth flat?',
    'Is water wet? ',
    'Is the sky blue?',
    'Is a tomato a fruit?',
    'Do humans have wings? '
  ];

  List<bool>answers=[
    false,
    true,
    true,
    true,
    false
  ];

  int questionNumber = 0;



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
              child: Text(Questions[questionNumber],textAlign: TextAlign.center,
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
                  // questionNumber =questionNumber+1;
                  bool correct = answers[questionNumber];
                  if(correct==true){
                    print("you are right");
                  }else{
                    print("you are wrong");
                  }
                  setState(() {
                    questionNumber++;
                  //   Scorekeeper.add(Icon(Icons.check ,color: Colors.green,));
                   });

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
                  bool correct = answers[questionNumber];
                  if(correct==false){
                    print("you are right");
                  }else{
                    print("you are wrong");
                  }
                  setState(() {
                    questionNumber++;
                    //   Scorekeeper.add(Icon(Icons.check ,color: Colors.green,));
                  });
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


