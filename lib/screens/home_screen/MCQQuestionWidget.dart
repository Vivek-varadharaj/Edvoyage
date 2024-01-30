import 'dart:async';
import 'package:flutter/material.dart';

class MCQQuestionWidget extends StatefulWidget {
  @override
  _MCQQuestionWidgetState createState() => _MCQQuestionWidgetState();
}

class _MCQQuestionWidgetState extends State<MCQQuestionWidget> {
  int selectedOption = -1;
  int correctAnswerIndex = -1; // Track the correct answer separately
  int currentQuestionIndex = 0;
  Color optionColor = Colors.white; // Default color
  Color optionColor2 = Colors.white;
  Color optionColor3 = Colors.white; // Default color
  Color optionColor4 = Colors.white;
  String status = "No Answer";
  bool showAnswer = false;
  int selectedIndex = -1;

  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the capital of India?",
      "options": ["Delhi", "Mumbai", "Kolkata", "Chennai"],
      "answer": 0,
    },
    {
      "question": "What is the capital of Pakistan?",
      "options": ["Karachi", "Islamabad", "Lahore", "Quetta"],
      "answer": 1,
    },
    {
      "question": "What is the capital of USA?",
      "options": ["New York", "Washington DC", "California", "Texas"],
      "answer": 1,
    },
    {
      "question": "What is the capital of China?",
      "options": ["Shanghai", "Beijing", "Hong Kong", "Shenzhen"],
      "answer": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    print("Building UI for Question ${currentQuestionIndex + 1}");
    return Container(
        child: Column(children: [
      Text(
        'Question ${currentQuestionIndex + 1}',
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      Text(
        questions[currentQuestionIndex]["question"] as String,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 18,
        ),
      ),
      SizedBox(height: 10),
      Column(
        children: [
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              setState(() {
                showAnswer = true;
                selectedIndex = 0;
              });
              if (questions.length - 1 > currentQuestionIndex) {
                Future.delayed(Duration(seconds: 3), () {
                  setState(() {
                    currentQuestionIndex = currentQuestionIndex + 1;
                    showAnswer = false;
                    selectedIndex = -1;
                  });
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                  "No more questions",
                  style: TextStyle(fontFamily: "Roboto"),
                )));
              }
            },
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
                color: showAnswer
                    ? questions[currentQuestionIndex]["answer"] == 0
                        ? Colors.green
                        : selectedIndex == 0
                            ? Colors.red
                            : optionColor
                    : optionColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: optionColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          " A ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      questions[currentQuestionIndex]["options"]![0] as String,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              setState(() {
                showAnswer = true;
                selectedIndex = 1;
              });
              if (questions.length - 1 > currentQuestionIndex) {
                Future.delayed(Duration(seconds: 3), () {
                  setState(() {
                    currentQuestionIndex = currentQuestionIndex + 1;
                    showAnswer = false;
                    selectedIndex = -1;
                  });
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                  "No more questions",
                  style: TextStyle(fontFamily: "Roboto"),
                )));
              }
            },
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
                color: showAnswer
                    ? questions[currentQuestionIndex]["answer"] == 1
                        ? Colors.green
                        : selectedIndex == 1
                            ? Colors.red
                            : optionColor
                    : optionColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: optionColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          " B ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      questions[currentQuestionIndex]["options"]![1] as String,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              setState(() {
                showAnswer = true;
                selectedIndex = 2;
              });
              if (questions.length - 1 > currentQuestionIndex) {
                Future.delayed(Duration(seconds: 3), () {
                  setState(() {
                    currentQuestionIndex = currentQuestionIndex + 1;
                    showAnswer = false;
                    selectedIndex = -1;
                  });
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                  "No more questions",
                  style: TextStyle(fontFamily: "Roboto"),
                )));
              }
            },
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
                color: showAnswer
                    ? questions[currentQuestionIndex]["answer"] == 2
                        ? Colors.green
                        : selectedIndex == 2
                            ? Colors.red
                            : optionColor
                    : optionColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: optionColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          " C ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      questions[currentQuestionIndex]["options"]![2] as String,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              setState(() {
                showAnswer = true;
                selectedIndex = 3;
              });
              if (questions.length - 1 > currentQuestionIndex) {
                Future.delayed(Duration(seconds: 3), () {
                  setState(() {
                    currentQuestionIndex = currentQuestionIndex + 1;
                    showAnswer = false;
                    selectedIndex = -1;
                  });
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                  "No more questions",
                  style: TextStyle(fontFamily: "Roboto"),
                )));
              }
            },
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
                color: showAnswer
                    ? questions[currentQuestionIndex]["answer"] == 3
                        ? Colors.green
                        : selectedIndex == 3
                            ? Colors.red
                            : optionColor
                    : optionColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: optionColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          " D ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      questions[currentQuestionIndex]["options"]![3] as String,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ]));
  }
}
