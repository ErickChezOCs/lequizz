import 'package:flutter/material.dart';
import 'package:lequizz/model/question.dart';

void main() {
  runApp(const MyQuiz());
}

class MyQuiz extends StatefulWidget {
  const MyQuiz({Key? key}) : super(key: key);

  @override
  State<MyQuiz> createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> {

   int _currentQuestionIndex = 0 ;

  List questionBank = [
    Question.name("George Washington was one of the Founding Fathers.", true),
    Question.name("The independence war started on April 19, 1775.", true),
    Question.name("In the war, American patriot forces were supported by Hessian soldiers .",false),
    Question.name("In the war, British forces were supported by the Kingdom of France and the Kingdom of Spain.", false),
    Question.name("the American colonies were established by a Royal Charter.", true),
    Question.name("The world’s first domed air-conditioned indoor stadium was built in houston.",true),
    Question.name("Pittsburg's nickname is 'Iron City'.", true),
    Question.name("The Everglades are found in the state of Utah.", false),
    Question.name("Tennessee was not one of the 13 original U.S. states.", true),
    Question.name("Homeland is one of the three branches of government.", false),
    Question.name("New-York city was historically known as New Amsterdam.", true),
    Question.name("Bwa Kalé is a city in the USA.", false),
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le Quizz',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz sur les USA'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        backgroundColor: Colors.blueGrey,

        body: Builder(
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(child: Image.asset(
                  "images/usa_flag.png", width: 250, height: 180,)),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                          color: Colors.blueGrey.shade400,
                          style: BorderStyle.solid
                      )
                  ),
                  height: 120.0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0,),
                      child: Text(
                        questionBank[_currentQuestionIndex].questionText,
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
            ElevatedButton(
            onPressed: () => _lastQuestion(),
            child: const Icon(Icons.arrow_back_sharp),
            ),
                    ElevatedButton(
                      onPressed: () => {
                        _nextQuestion(),
                        if (questionBank[_currentQuestionIndex].isCorrect==true){
                             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                               backgroundColor:Colors.green,
                               duration: Duration(milliseconds: 500),
                               content: Text('Correct Answer you get the point!'),
                        ),
                      )
                        } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor:Colors.red,duration: Duration(milliseconds: 500),content: Text('Incorrect Answer you miss the point!'),
            ),
            )
                        }
                      },
                      child: const Text("TRUE"),
                    ),
                    ElevatedButton(
                      onPressed: ()  {
                        _nextQuestion();
                        if (questionBank[_currentQuestionIndex].isCorrect==false){
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            backgroundColor:Colors.green,
                              duration: Duration(milliseconds: 500),content: Text('Correct Answer you get the point!'),
                          ),
                          );

                        } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor:Colors.red,duration: Duration(milliseconds: 500),content: Text('Incorrect Answer you miss the point!'),
            ),
            );
            }
                      }  ,
                      child: const Text("FALSE"),
                    ),
                    ElevatedButton(
                      onPressed: () => _nextQuestion(),
                      child: const Icon(Icons.arrow_forward_sharp),
                    ),

                  ],
                )
              ],
            );
          }
        )

      ),
    );
  }

  /*_checkAnswer(bool userChoice) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect){
      debugPrint(" yes correct!");
      final snackbar = SnackBar(content: Text("Correct"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      debugPrint("Incorrect!");
      final snackbar = SnackBar(content: Text("Incorrect"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);

    }

  }*/

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });


  }
   _lastQuestion() {
     setState(() {
       _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
     });


   }

}
