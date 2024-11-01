import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String result;
  const Result({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'), // Add a title for clarity
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0), // Add some padding
          child: Text(
            'Your BMI is: $result',
            style: const TextStyle(
              color: Colors.greenAccent,
              fontSize: 24, // Increase font size for better visibility
              fontWeight: FontWeight.bold, // Make the text bold
            ),
            textAlign: TextAlign.center, // Center the text
          ),
        ),
      ),
    );
  }
}
