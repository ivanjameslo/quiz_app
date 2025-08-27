import 'package:flutter/material.dart';

class SummaryList extends StatelessWidget {
  const SummaryList({
    super.key,
    required this.summaryData,
  });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400, // Fixed height to make it scrollable
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: summaryData.map((data) {
            final questionIndex = data['question_index'] as int;
            final question = data['question'] as String;
            final correctAnswer = data['correct_answer'] as String;
            final userAnswer = data['user_answer'] as String;
            final isCorrect = userAnswer == correctAnswer;
            
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Colored Circle with Number
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isCorrect ? Colors.green : Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        '${questionIndex + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  
                  // Question and Answers
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          question,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Your answer: $userAnswer',
                          style: TextStyle(
                            color: isCorrect ? const Color.fromARGB(255, 70, 152, 74) : const Color.fromARGB(255, 199, 64, 64),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Correct answer: $correctAnswer',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 70, 152, 74),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
