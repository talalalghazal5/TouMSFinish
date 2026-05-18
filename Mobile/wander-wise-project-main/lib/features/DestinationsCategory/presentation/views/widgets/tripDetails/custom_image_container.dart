import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({
    super.key,
    required this.height,
    required this.width,
    required this.imagePath,
    this.ontap,
  });
  final double height;
  final double width;
  final String imagePath;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
