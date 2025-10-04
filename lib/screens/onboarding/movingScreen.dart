import 'package:flutter/material.dart';
import 'package:wallet/constants/appColor.dart';
import 'package:wallet/constants/appPadding.dart';

class Movingscreen extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;

  const Movingscreen({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(defalutPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(height: 20),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: AppsubTextColor),
            ),
            
          ],
        ),
      ),
    );
  }
}
