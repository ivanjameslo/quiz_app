import 'package:flutter/material.dart';

const Alignment alignmentTopLeft = Alignment.topLeft;
const Alignment alignmentBottomRight = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required Center child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            const Color.fromARGB(255, 105, 28, 119),
            const Color.fromARGB(255, 203, 40, 119),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}