import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String result;
  const Result({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFA0D683),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xFFF72BF78),
      
        centerTitle: true,
        title: const Text('BMI Result',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        ),
         // Add a title for clarity
      ),
      body: Center(
        
        child: Container(
          
          padding: const EdgeInsets.all(20.0), // Add some padding
          child: Text(
            'Your BMI is: $result',
            style: const TextStyle(
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
