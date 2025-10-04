import 'package:flutter/material.dart';
import 'package:wallet/constants/appColor.dart';

class CustomButtonWidget extends StatelessWidget {
  final String btnName;
  final Color btnColor;
  const CustomButtonWidget({
    super.key,
    required this.btnName,
    required this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
       height: MediaQuery.of(context).size.height * 0.06,
       width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: btnColor,
      ),
      child: Center(
        child: Text(
          btnName,
          style: TextStyle(color: AppWhiteColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
