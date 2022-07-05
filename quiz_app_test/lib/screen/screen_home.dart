import 'package:flutter/material.dart';
import 'package:quiz_app_test/model/model_quiz.dart';
import 'package:quiz_app_test/screen/screen_quiz.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app_test/model/api_adapter.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Quiz> quizzes = [];
  bool isLoading = false;

  _fetchQuizzes() async {
    setState(() {
      isLoading = true;
    });
    final response = await http
        .get(Uri.parse('https://drf-quiz-test.herokuapp.com/quiz/3/'));
    if (response.statusCode == 200) {
      setState(() {
        quizzes = parseQuizzes(utf8.decode(response.bodyBytes));
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load data.');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: const Text('My Quiz APP'),
            backgroundColor: Colors.deepPurple,
            leading: Container(),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'images/quiz.jpeg',
                  width: width * 0.8,
                ),
              ),
              Padding(padding: EdgeInsets.all(width * 0.024)),
              Text(
                'Flutter Quiz App',
                style: TextStyle(
                  fontSize: width * 0.065,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Check the instructions before starting the quiz. \n Read Carefully.",
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.all(width * 0.048)),
              _buildStep(width, "1. Try 3 random quiz questions."),
              _buildStep(width,
                  "2. Read the question carefully,\nchoose the answer,\nand press the next button"),
              _buildStep(width, "3. Try to get a perfect score"),
              Padding(padding: EdgeInsets.all(width * 0.048)),
              Container(
                padding: EdgeInsets.only(bottom: width * 0.036),
                child: Center(
                  child: ButtonTheme(
                    minWidth: width * 0.8,
                    height: height * 0.05,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: <Widget>[
                                CircularProgressIndicator(),
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.036),
                                ),
                                Text("Loading..."),
                              ],
                            ),
                          ),
                        );
                        _fetchQuizzes().whenComplete(() {
                          return Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      QuizScreen(quizzes: quizzes)));
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                      ),
                      child: const Text("Try Quiz",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(double width, String title) {
    return Container(
        padding: EdgeInsets.fromLTRB(
            width * 0.048, width * 0.024, width * 0.048, width * 0.024),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.check_box,
              size: width * 0.04,
            ),
            Padding(
              padding: EdgeInsets.only(right: width * 0.024),
            ),
            Text(title),
          ],
        ));
  }
}
