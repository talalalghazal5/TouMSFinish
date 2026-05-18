import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Padding(
      padding: EdgeInsets.all(width * 0.07),
      child: Container(
        padding: EdgeInsets.only(bottom: 16, top: 16),
        height: height * 0.8,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: kprimaryColor4.withValues(alpha: 0.8)),
        ),
        child: child,
      ),
    );
  }
}
