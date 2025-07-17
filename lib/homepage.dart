import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        const Text(
          'Welcome to the Home Page!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const Text(
          'This is a simple Flutter app using Provider.',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            // Add navigation or logic here
          },
          child: const Text('Get Started'),
        ),
          ],
        ),
      ),
      );
    
  }
}