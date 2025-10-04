import 'package:flutter/material.dart';
import 'package:wallet/constants/appColor.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', fit: BoxFit.cover),
            SizedBox(height: 20),
            Text(
              'Easy Wallet',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppMainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
