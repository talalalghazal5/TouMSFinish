import 'package:flutter/material.dart';

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // ابدأ من أسفل اليسار
    path.lineTo(0, 40);

    // شكل الموجة: من اليسار إلى اليمين بميل خفيف لأعلى
    path.quadraticBezierTo(
      size.width / 2, 0,           // نقطة التحكم (قلب المنحنى)
      size.width, 40,              // نهاية المنحنى
    );

    // باقي الحدود
    path.lineTo(size.width, size.height); // يمين تحت
    path.lineTo(0, size.height);          // يسار تحت
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
