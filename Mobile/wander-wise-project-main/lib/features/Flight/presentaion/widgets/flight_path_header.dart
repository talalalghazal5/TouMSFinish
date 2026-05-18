import 'package:flutter/material.dart';
import 'package:wander_wise_app/features/Flight/presentaion/widgets/curved_divider_with_icon.dart';

class FlightPathHeader extends StatelessWidget {
  const FlightPathHeader({super.key, required this.fromCode, required this.fromCity, required this.toCode, required this.toCity});

  final String fromCode;
  final String fromCity;
  final String toCode;
  final String toCity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: const BoxDecoration(
        color: Color(0xFF0A3D62),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Select Flight',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    fromCode,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    fromCity,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Transform.translate(
                    offset: const Offset(0, -10), // تحريك لأعلى 10 بكسل
                    child: const CurvedDividerWithIcon(),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    toCode,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    toCity,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
