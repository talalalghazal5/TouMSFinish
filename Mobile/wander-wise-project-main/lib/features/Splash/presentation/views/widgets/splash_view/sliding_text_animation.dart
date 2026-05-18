import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';

class SlidingTextAnimation extends StatelessWidget {
  const SlidingTextAnimation({super.key, required this.slidingTextAnimation});

  final Animation<Offset> slidingTextAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingTextAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingTextAnimation,
          child: Text(
            'Explore The World Easly!',
            textAlign: TextAlign.center,
            style: textStyleSize14.copyWith(color: kprimaryColor1 , fontWeight: FontWeight.normal),
          ),
        );
      },
    );
  }
}
