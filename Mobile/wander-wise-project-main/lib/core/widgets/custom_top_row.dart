import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';

class CustomTopRow extends StatelessWidget {
  const CustomTopRow({super.key, required this.ontap});
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.more_vert, color: kprimaryColor1, size: 25),
        GestureDetector(
          onTap: ontap,
          child: Text(
            'Skip >',
            style: textStyleSize25.copyWith(color: kprimaryColor1),
          ),
        ),
      ],
    );
  }
}
