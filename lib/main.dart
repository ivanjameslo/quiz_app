import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_manager.dart';

void main() {
  runApp(
    QuizManager(),
  );
}

// class ColumnDemo extends StatelessWidget {
//   const ColumnDemo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start, // default
//           // crossAxisAlignment: CrossAxisAlignment.center, // default
//           // mainAxisSize: MainAxisSize.max, // default
//           children: [
//             Container(width: 400, height: 100, color: Colors.amber),
//             Container(width: 400, height: 100, color: Colors.purple),
//             Container(width: 400, height: 100, color: Colors.green),
//           ]
//         )
//       )
//     );
//   }
// }