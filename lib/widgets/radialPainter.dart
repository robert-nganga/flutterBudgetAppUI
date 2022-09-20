import 'dart:math';
import 'package:flutter/material.dart';

class RadialPainter extends CustomPainter {
  final double percent;
  final double width;
  final Color bgColor;
  final Color lineColor;

  RadialPainter({required this.width, required this.lineColor, required this.percent, required this.bgColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint bgLine = Paint()
      ..color = bgColor
      ..strokeWidth = width
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Paint completeLine = Paint()
      ..color = lineColor
      ..strokeWidth = width
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, bgLine);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi / 2, 2 * pi * percent, false, completeLine);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}