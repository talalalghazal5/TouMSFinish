// lib/features/booking/flight_booking/presentation/widgets/flight_date_picker.dart
import 'package:flutter/material.dart';

class FlightDatePicker extends StatelessWidget {
  final String label;
  final String date;
  final VoidCallback onTap;

  const FlightDatePicker({
    super.key,
    required this.label,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xff81C3D7),
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          suffixIcon: const Icon(
            Icons.calendar_today,
            color: Color(0xff3A7CA5),
          ),
        ),
        child: Text(date),
      ),
    );
  }
}
