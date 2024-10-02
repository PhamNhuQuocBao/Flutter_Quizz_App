import 'package:flutter/material.dart';
import 'package:quizz_app/question.class.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final tickIcon = const Icon(Icons.check, color: Colors.green);
  final crossIcon = const Icon(Icons.clear, color: Colors.red);
  int count = 0;
  //List of Icons which is added to the bottom of the screen
  List<Icon> iconsList = [];

  final List<Question> questionsList = [
    Question('1+1=2', true),
    Question('Con cá có thể sống trên cạn', false),
    Question('Nước sôi ở 100 độ C', true),
    Question('Trái đất là hành tinh lớn nhất trong Hệ Mặt Trời.', false),
    Question('Kim cương là chất cứng nhất trong tự nhiên.', true),
    Question('Mặt trời mọc ở hướng tây.', false),
    Question('Có 12 tháng trong một năm.', true),
    Question('Tất cả loài chim đều biết bay.', false),
    Question('Cá voi là loài động vật có vú.', true),
    Question('Sắt là một nguyên tố hoá học.', true),
    Question('Google was originally called \"Backrub\".', true),
    Question('Con người có 206 cái xương khi trưởng thành.', false),
    Question('Mặt trăng lớn hơn Mặt trời. ', false),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF333333),
        body: _body(),
      ),
    );
  }

  _body() {
    ///
    /// Column1
    ///
    return Column(
      // Divide the the vertical space between the children
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      // Stretch the children horizontally to the screen size
      // as we need to stretch the buttons
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        Center(

            ///
            /// Text Widget with some padding
            ///
            child: Padding(
          padding: const EdgeInsets.only(top: 110, left: 20, right: 20),
          child: Text(
            questionsList[count].question,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
        )),

        ///
        /// Column2
        ///
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ///
            /// True Button
            ///
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                _checkAnswer(true);
              },
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'True',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            ///
            /// To give some space between buttons
            ///
            const SizedBox(height: 8),

            ///
            /// False Button
            ///
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                _checkAnswer(false);
              },
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'False',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            ///
            /// Row for Tick-Cross Icons to align them horizontally.
            ///
            Row(children: iconsList)
          ],
        ),
      ],
    );
  }

  _checkAnswer(selectedAnswer) {
    if (selectedAnswer == questionsList[count].correctAnswer) {
      //Correct answer

      setState(() {
        iconsList.add(tickIcon);

        // Check if don't cross list size limit which will result in error
        if (count < questionsList.length - 1) count++;
      });
    } else {
      //Incorrect answer
      setState(() {
        iconsList.add(crossIcon);

        // Check if don't cross list size limit which will result in error
        if (count < questionsList.length - 1) count++;
      });
    }
  }
}
