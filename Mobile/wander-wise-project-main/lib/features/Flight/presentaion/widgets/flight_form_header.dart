// lib/features/booking/flight_booking/presentation/widgets/flight_form_header.dart
import 'package:flutter/material.dart';

class FlightFormHeader extends StatelessWidget {
  const FlightFormHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF0A3D62),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          const Positioned(
            left: 0,
            bottom: 0,
            child: Text(
              'Book Your\nFlight',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              'lib/core/assets/slider/—Pngtree—a white cargo plane providing_13336141.png',
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
