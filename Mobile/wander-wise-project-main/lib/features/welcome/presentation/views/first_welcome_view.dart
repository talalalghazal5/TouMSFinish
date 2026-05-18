import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/utils/assets.dart';
import 'package:wander_wise_app/core/widgets/custom_background_image.dart';
class FirstWelcomeView extends StatelessWidget {
  const FirstWelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        BackGroundImage(photoPath: ImagesPaths.background1, width: width),
      ],
    );
  }
}
