import 'dart:ffi';

import 'package:quiz_app/questions.dart';
class QuizBrain{
  int _qNumber=0;
  List<Questions> _questionAnswers=[
    Questions(q: 'Question 1 is true', a: true),
    Questions(q: 'This one is supposed to be false', a: false),
    Questions(q: "Let's say this is true", a: false),
    Questions(q: 'Ummm... this one is false?', a: true),
    Questions(q: 'Just to try it out tick this one false', a: true),
    Questions(q: 'At this point just check something!', a: true),
    Questions(q: 'Do you trust me?', a: false),
    Questions(q: "You should! With all honesty answer to this one is false", a: true),
    Questions(q: "Tried fooling you, go on this is the last question and it's true!", a: false),
  ];
  bool finished=false;
  void nextQuestion(){
    if(_qNumber<_questionAnswers.length-1){
      _qNumber++;
    }
  }
  String getQuestionText(){
   return _questionAnswers[_qNumber].questionText;
  }
  bool getAnswer(){
    return _questionAnswers[_qNumber].questionAnswer;
  }
  bool isFinished() {
    if (_qNumber == _questionAnswers.length - 1) {
      finished=true;
      return finished;
    }
    else {
      return finished;
    }
  }
  void reset(bool finished){
    if(finished){
      _qNumber=0;
    }
  }
}