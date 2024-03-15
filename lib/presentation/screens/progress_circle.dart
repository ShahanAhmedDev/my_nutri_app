import 'package:flutter/material.dart';
import 'dart:math';

import 'package:my_nutri_app/utils/resources/app_colors.dart';

class CustomCircularIndicator extends StatelessWidget {
  final double caloriesBurned; // Should be between 0 and 1
  final double caloriesConsumed; // Should be between 0 and 1
  final double caloriesRemaining; // Should be between 0 and 1

  CustomCircularIndicator({
    required this.caloriesBurned,
    required this.caloriesConsumed,
    required this.caloriesRemaining,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: CustomPaint(
        painter: _CircularProgressPainter(
          caloriesBurned: caloriesBurned,
          caloriesConsumed: caloriesConsumed,
          caloriesRemaining: caloriesRemaining,
        ),
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double caloriesBurned;
  final double caloriesConsumed;
  final double caloriesRemaining;
  final double strokeWidth = 12.0; // Increased for better visibility
  final double gapSize = 3.0; // Size of the gap between each segment and lines

  _CircularProgressPainter({
    required this.caloriesBurned,
    required this.caloriesConsumed,
    required this.caloriesRemaining,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = size.center(Offset.zero);
    double radius = size.width / 2;
    double totalGapSize = 25.0; // Total gap in pixels you want between the lines
    double gapRadians = totalGapSize / radius; // Convert total gap size to radians for accurate spacing

    // Define paints with round caps for circular borders on each line
    Paint burnedPaint = Paint()
      ..strokeWidth = strokeWidth
      ..color = AppColors.nutriGreen
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // Make ends of lines rounded

    Paint consumedPaint = Paint()
      ..strokeWidth = strokeWidth
      ..color = AppColors.nutriGrey
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // Make ends of lines rounded

    Paint remainingPaint = Paint()
      ..strokeWidth = strokeWidth
      ..color = AppColors.nutriRed
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // Make ends of lines rounded

    // Calculate segment sweeps accounting for the gaps
    // Since there are gaps before each segment, we subtract the radians equivalent of the gap size
    double burnedSweep = 2 * pi * caloriesBurned - gapRadians;
    double consumedSweep = 2 * pi * caloriesConsumed - gapRadians;
    double remainingSweep = 2 * pi * caloriesRemaining - gapRadians;

    // Adjust sweeps to ensure total does not exceed 360 degrees minus gaps for 3 segments
    double totalSweep = burnedSweep + consumedSweep + remainingSweep + (gapRadians * 3);
    if (totalSweep > 2 * pi) {
      double excess = totalSweep - 2 * pi;
      // Proportionally reduce each sweep to fit within the circle
      burnedSweep -= excess * (burnedSweep / totalSweep);
      consumedSweep -= excess * (consumedSweep / totalSweep);
      remainingSweep -= excess * (remainingSweep / totalSweep);
    }

    // Draw each segment with gaps
    double startAngle = -pi / 2; // Starting at the top (270 degrees)

    // Burned calories
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, burnedSweep, false, burnedPaint);
    startAngle += burnedSweep + gapRadians;

    // Consumed calories
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, consumedSweep, false, consumedPaint);
    startAngle += consumedSweep + gapRadians;

    // Remaining calories
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, remainingSweep, false, remainingPaint);



    // After drawing the circle, add the text and dots.
    final textSpan = TextSpan(
      text: '1645',
      style: TextStyle(
        color: AppColors.nutriGreenDark,
        fontWeight: FontWeight.bold,
        fontSize: 40.0, // Adjust the size accordingly
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    // Position the text in the center of the canvas
    final textOffset = Offset((size.width - textPainter.width) / 2, (size.height - textPainter.height) / 2);
    textPainter.paint(canvas, textOffset);

    // Draw two dots below the text
    Paint dotPaint = Paint()
      ..color = AppColors.nutriGreenCircle
      ..style = PaintingStyle.fill;

    Paint dotPaint2 = Paint()
      ..color = AppColors.nutriGreenCircle2
      ..style = PaintingStyle.fill;
    double dotRadius = 5.0; // Adjust the dot size as needed
    double dotSpacing = 20.0; // Space between the dots

    // Calculate the position of the first dot
    Offset dotOneCenter = Offset(size.width / 2 - dotSpacing / 2, textOffset.dy + textPainter.height + 15.0);
    canvas.drawCircle(dotOneCenter, dotRadius, dotPaint);

    // Calculate the position of the second dot
    Offset dotTwoCenter = Offset(size.width / 2 + dotSpacing / 2, textOffset.dy + textPainter.height + 15.0);
    canvas.drawCircle(dotTwoCenter, dotRadius, dotPaint2);

  }



  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

