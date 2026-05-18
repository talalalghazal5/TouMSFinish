import 'package:flutter/material.dart';
import 'package:wander_wise_app/features/welcome/presentation/views/widgets/second_welcome/custom_second_row.dart';

class CustomSecondContainer extends StatelessWidget {
  const CustomSecondContainer({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.9,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 249, 249, 250).withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          CustomSecondRow(
            value: 'Discover, book , enjoy— every journey starts here!',
          ),
          CustomSecondRow(
            value: 'Everything you need for your trip... in one app.',
          ),
          CustomSecondRow(value: 'A complete service to organize your trip.'),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
