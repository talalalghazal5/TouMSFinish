import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';

class CustomSecondRow extends StatelessWidget {
  const CustomSecondRow({super.key, required this.value});
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(size: 25, Icons.done_outlined, color: kprimaryColor6),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: kprimaryColor5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
