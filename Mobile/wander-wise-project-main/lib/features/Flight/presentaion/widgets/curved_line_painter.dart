import 'package:flutter/material.dart';

class CurvedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white70
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(size.width / 2, 0, size.width, size.height);

    // تحويل المسار إلى dashed line
    final pathMetrics = path.computeMetrics();
    for (final metric in pathMetrics) {
      double distance = 0.0;
      const double dashLength = 8.0;
      const double gapLength = 4.0;

      while (distance < metric.length) {
        final next = distance + dashLength;
        final segment = metric.extractPath(
          distance,
          next < metric.length ? next : metric.length,
        );
        canvas.drawPath(segment, paint);
        distance += dashLength + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}