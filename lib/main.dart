import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(Quizzler());
}
class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            home: Scaffold(
              backgroundColor: Colors.black,
              body: SafeArea(
                child: QuizApp(),
              ),
            ),
    );
  }
}


class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int finalScore=0;
  List<Icon> scoreKeeper= [];
  void displayAnswer(bool checkAnswer){
    setState((){
      if(quizBrain.isFinished()){
        Alert(
          context: context,
          type: AlertType.error,
          title: "ATTENTION",
          desc: "Your quiz is finished. Tap on the button to continue!",
          buttons: [
            DialogButton(
              child: Text(
                "CONTINUE",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        quizBrain.reset(quizBrain.finished);
        scoreKeeper.clear();
        quizBrain.finished=false;
      }
      else{
        if(quizBrain.getAnswer()==checkAnswer){
          scoreKeeper.add(Icon(Icons.check_circle_outline_sharp, color: Colors.green,));
        }else{
          scoreKeeper.add(Icon(Icons.cancel_outlined, color: Colors.red,));
        }
        quizBrain.nextQuestion();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Center(
                    child:
                    Text(
                        quizBrain.getQuestionText(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        primary: Colors.white,
                      ),
                      onPressed: (){
                        displayAnswer(true);
                      },
                      child: Text(
                          'True',
                      ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      primary: Colors.white,
                    ),
                      onPressed: (){
                        displayAnswer(false);
                      },
                      child: Text(
                          'False',
                      ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: scoreKeeper,
                ),
              ),
            ],
    );
  }
}
