import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  
  // Sample quiz questions and answers
  final List<Map<String, Object>> questions = [
    {
      'questionText': 'What is the main programming language used in Flutter?',
      'answers': [
        {'text': 'Dart', 'isCorrect': true},
        {'text': 'Java', 'isCorrect': false},
        {'text': 'Kotlin', 'isCorrect': false},
        {'text': 'JavaScript', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which company developed Flutter?',
      'answers': [
        {'text': 'Facebook', 'isCorrect': false},
        {'text': 'Google', 'isCorrect': true},
        {'text': 'Microsoft', 'isCorrect': false},
        {'text': 'Apple', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What does the "hot reload" feature do in Flutter?',
      'answers': [
        {'text': 'Restarts the entire app', 'isCorrect': false},
        {'text': 'Updates UI instantly without losing app state', 'isCorrect': true},
        {'text': 'Compiles the code to native', 'isCorrect': false},
        {'text': 'Debugs the application', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which widget is used for creating a scrollable list in Flutter?',
      'answers': [
        {'text': 'Column', 'isCorrect': false},
        {'text': 'Row', 'isCorrect': false},
        {'text': 'ListView', 'isCorrect': true},
        {'text': 'Container', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the root widget of every Flutter app?',
      'answers': [
        {'text': 'Scaffold', 'isCorrect': false},
        {'text': 'MaterialApp', 'isCorrect': true},
        {'text': 'Container', 'isCorrect': false},
        {'text': 'Column', 'isCorrect': false},
      ],
    },
  ];

  void _answerQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
    
    // Show a brief feedback (you can customize this)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Moving to next question...'),
        duration: Duration(milliseconds: 800),
        backgroundColor: Colors.white.withOpacity(0.8),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Check if quiz is finished
    if (currentQuestionIndex >= questions.length) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quiz Completed! 🎉',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentQuestionIndex = 0;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: Text(
                'Restart Quiz',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Question counter
            Text(
              'Question ${currentQuestionIndex + 1}/${questions.length}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
            
            SizedBox(height: 20),
            
            // Question text
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white.withOpacity(0.3)),
              ),
              child: Text(
                questions[currentQuestionIndex]['questionText'] as String,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            
            SizedBox(height: 40),
            
            // Answer buttons
            ...((questions[currentQuestionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 16),
                child: ElevatedButton(
                  onPressed: _answerQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    elevation: 3,
                  ),
                  child: Text(
                    answer['text'] as String,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }).toList()),
          ],
        ),
      ),
    );
  }
}
