

import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, required this.title, required this.ontap});
  final String title;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: height * 0.06,
          width: width * 0.4,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: kListColor),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              title,
              style:textStyleSize20.copyWith(color: kprimaryColor),
            ),
          ),
        ),
      ),
    );
  }
}