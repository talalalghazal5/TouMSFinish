// lib/features/booking/flight_booking/presentation/widgets/flight_text_field.dart
import 'package:flutter/material.dart';

class FlightTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData? icon;
  final TextInputType? keyboardType;

  const FlightTextField({
    super.key,
    required this.label,
    required this.controller,
    this.icon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xff81C3D7),
        prefixIcon: icon != null
            ? Icon(icon, color: const Color(0xff3A7CA5))
            : null,
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xff3A7CA5), width: 2),
        ),
      ),
    );
  }
}
