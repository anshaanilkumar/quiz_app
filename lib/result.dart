import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int correct;
  final int wrong;
  final VoidCallback onReset;


  const ResultPage({
    super.key,
    required this.correct,
    required this.wrong,
    required this.onReset,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Your Final Score",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 40),
                  const SizedBox(width: 15),
                  Text("Correct: $correct",
                      style: const TextStyle(fontSize: 22)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.cancel, color: Colors.red, size: 40),
                  const SizedBox(width: 15),
                  Text("Wrong: $wrong",
                      style: const TextStyle(fontSize: 22)),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: onReset,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Reset"),
                ),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(30),
                //     ),
                //     backgroundColor: Colors.white,
                //     shadowColor: Colors.black54,
                //     elevation: 10,
                //   ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
