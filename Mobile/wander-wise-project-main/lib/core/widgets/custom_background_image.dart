import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({super.key, required this.photoPath, required this.width});
  final String photoPath;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.asset(photoPath, width: width, fit: BoxFit.cover),
    );
  }
}
