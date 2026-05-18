import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/utils/assets.dart';
import 'package:wander_wise_app/core/widgets/custom_background_image.dart';
import 'package:wander_wise_app/features/welcome/presentation/views/widgets/second_welcome/custom_second_column.dart';

class SecondWelcomeView extends StatelessWidget {
  const SecondWelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Stack(
      children: [
        BackGroundImage(photoPath: ImagesPaths.background2, width: width),
        Positioned.fill(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.01,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: CustomSecondColumn(width: width, height: height),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
