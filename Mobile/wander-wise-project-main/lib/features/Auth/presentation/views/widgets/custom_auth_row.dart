import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/utils/styles.dart';

class CustomAuthRow extends StatelessWidget {
  const CustomAuthRow({
    super.key,
    required this.firstTitle,
    required this.secondTitle,
    required this.onTap,
  });
  final String firstTitle;
  final String secondTitle;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$firstTitle  ',
          style: textStyleSize14,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            secondTitle,
            style: textStyleSize15,
          ),
        ),
      ],
    );
  }
}
