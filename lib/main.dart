import 'package:flutter/material.dart';
import 'package:wallet/screens/onboarding._screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: Colors.white, body: OnboardingScreen()),
    );
  }
}
