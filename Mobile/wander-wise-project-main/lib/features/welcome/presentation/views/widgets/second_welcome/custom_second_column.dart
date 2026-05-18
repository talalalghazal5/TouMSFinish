import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/welcome/presentation/views/widgets/second_welcome/custom_second_container.dart';

class CustomSecondColumn extends StatelessWidget {
  const CustomSecondColumn({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: height * 0.03),
        Text(
          'Welcome to  \n            WanderWise',
          style: textStyleSize30.copyWith(
            color: kprimaryColor1,
            shadows: [
              Shadow(
                color: kprimaryColor5,
                blurRadius: 0.2,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.02),
        Text(
          'Explore the world easly....',
          style: textStyleSize15.copyWith(
            color: kprimaryColor6,
          shadows: [
      Shadow(
        offset: Offset(2, 2),     
        blurRadius: 3.0,        
        color: kprimaryColor5,
      ),
    ],
          ),
        ),
        SizedBox(height: height * 0.11),
        CustomSecondContainer(width: width),
        SizedBox(height: height * 0.1),
        Text(
          'click Skip to Start your journey with our app ✈',
          textAlign: TextAlign.center,
          style: textStyleSize20,
        ),
        SizedBox(height: height * 0.03),
      ],
    );
  }
}
