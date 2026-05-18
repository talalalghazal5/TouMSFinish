import 'package:flutter/material.dart';
import 'package:wander_wise_app/features/Flight/presentaion/widgets/flight_form.dart';

class FlightBookingScreen extends StatelessWidget {
  const FlightBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: const SafeArea(
        child: FlightForm(),
      ),
    );
  }
}
