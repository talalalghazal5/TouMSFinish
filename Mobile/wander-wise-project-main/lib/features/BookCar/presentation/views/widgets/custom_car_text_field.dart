import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';

class CustomCarTextField extends StatelessWidget {
  const CustomCarTextField({
    super.key,
    required this.controller,
    this.validator,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator ?? (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      style: TextStyle(color: kprimaryColor5, fontSize: 17),
      decoration: InputDecoration(
        errorStyle: const TextStyle(fontSize: 15, color: Colors.red),
        filled: true,
        fillColor: Colors.white,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: kprimaryColor3),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: kprimaryColor3),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: kprimaryColor3),
        ),
      ),
    );
  }
}
