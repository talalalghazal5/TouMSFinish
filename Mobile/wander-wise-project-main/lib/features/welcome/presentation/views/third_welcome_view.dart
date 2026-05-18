import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/assets.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/core/widgets/custom_background_image.dart';
import 'package:wander_wise_app/features/welcome/presentation/views/widgets/third_welcome/custom_third_row.dart';

class ThirdWelcomeView extends StatelessWidget {
  const ThirdWelcomeView({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Stack(
      children: [
        BackGroundImage(photoPath: ImagesPaths.background3 , width: width,),
        Positioned(
          top: height * 0.08,
          left: width * 0.28,
          child: Text('WanderWise', style: textStyleSize30.copyWith(color: kprimaryColor1,shadows: [
    Shadow(
      color: kprimaryColor5,
      blurRadius: 0.2,
      offset: Offset(2, 2),
    ),
  ],)),
        ),
        Positioned(
          top: height * 0.8,
          child: CustomThirdRow(),
        ),
      ],
    );
  }
}
