import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomCircularProgressIndicator extends StatelessWidget {
  final double progress;
  final double size;
  final Color backgroundColor;
  final Color progressColor;

  const CustomCircularProgressIndicator({
    Key? key,
    required this.progress, // Progress value between 0.0 to 1.0
    this.size = 200.0, // Size of the circular progress indicator
    this.backgroundColor = Colors.grey, // Color for the background circle
    this.progressColor = Colors.blue, // Color for the progress arc
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _CircularProgressPainter(
          progress: progress,
          backgroundColor: backgroundColor,
          progressColor: progressColor,
        ),
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color progressColor;

  _CircularProgressPainter({
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth =5
      ..style = PaintingStyle.stroke;

    Paint progressPaint = Paint()
      ..shader = SweepGradient(
        colors: [progressColor.withOpacity(0.2), progressColor],
        startAngle: 0,
        endAngle: math.pi * 2 * progress,
      ).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2))
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, backgroundPaint);
    double angle = 2 * math.pi * progress;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -math.pi / 2, angle, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
