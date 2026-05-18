import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';

class PickWidget extends StatelessWidget {
  const PickWidget({
    super.key,
    required this.photoAvatar,
    this.onTap,
    required this.iconAvatar,
    required this.height,
    required this.width,
    this.showEditIcon = false,
  });

  final String photoAvatar;
  final dynamic onTap;
  final dynamic iconAvatar;
  final double width;
  final double height;
  final bool showEditIcon;
  @override
  Widget build(BuildContext context) {
    final isLocalFile =
        photoAvatar.startsWith('http') == false &&
        File(photoAvatar).existsSync();

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: isLocalFile
                ? FileImage(File(photoAvatar)) as ImageProvider
                : (photoAvatar.startsWith('http')
                      ? NetworkImage(photoAvatar)
                      : AssetImage(photoAvatar)),
          ),
          if (showEditIcon)
            Positioned(
              bottom: 10,
              right: 0,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: kprimaryColor4,
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(iconAvatar, color: Colors.white, size: 30),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
