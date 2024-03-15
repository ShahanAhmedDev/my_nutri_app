import 'package:flutter/material.dart';
import 'dart:ui';

class CurvedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Draw the arched curved line
    final Path path = Path();
    path.moveTo(0, 0); // Start at the top left
    path.quadraticBezierTo(size.width / 2, size.height * 2, size.width, 0); // Control point below the line
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
  return false;
  }
}