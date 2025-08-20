import 'package:quizz/question.dart';

class Quizbank{
  int _questionNumber = 0;

  List<Question> _questionList=[
    Question(q: 'Is the Earth flat?', a: false),
    Question(q: 'Is water wet? ', a: true),
    Question(q: 'Is the sky blue?', a: true),
    Question(q: 'Is a tomato a fruit?', a: true),
    Question(q: 'Do humans have wings? ', a: false),
    Question(q: 'Does a dog bark?', a: true),
    Question(q: 'Can fish fly? ', a: false),
  ];

  void nextQs(){
    if(_questionNumber < _questionList.length-1){
      _questionNumber++;
      print(_questionNumber);
      print(_questionList.length);
    }
  }
   String getQs(){
     return _questionList[_questionNumber].questionText;
   }

   bool getAns(){
     return _questionList[_questionNumber].questionAnswer;
   }

   bool isFinished(){
    if(_questionNumber==_questionList.length-1){
      return true;
    }else{
      return false;
    }
   }


  void reset(){
    _questionNumber = 0;
  }

}
