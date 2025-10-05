import 'package:flutter/material.dart';

class CustomeTextFormWidget extends StatelessWidget {
  final String fieldName;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscueText;

  const CustomeTextFormWidget({
    super.key,
    required this.fieldName,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscueText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscueText,
      decoration: InputDecoration(
        hintText: fieldName,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
    );
  }
}
