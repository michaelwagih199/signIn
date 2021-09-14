import 'package:flutter/material.dart';

class Arch extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    paint.color = Color(0xffE8E9EA);
    path = Path();
    path.lineTo(size.width, -0.01);
    path.cubicTo(size.width, size.height * 0.26, size.width * 0.95,
        size.height * 0.51, size.width * 0.85, size.height * 0.7);
    path.cubicTo(size.width * 0.76, size.height * 0.89, size.width * 0.63,
        size.height, size.width / 2, size.height);
    path.cubicTo(size.width * 0.37, size.height, size.width * 0.24,
        size.height * 0.89, size.width * 0.15, size.height * 0.7);
    path.cubicTo(
        size.width * 0.05, size.height * 0.51, 0, size.height * 0.26, 0, -0.01);
    path.cubicTo(0, -0.01, size.width / 2, -0.01, size.width / 2, -0.01);
    path.cubicTo(size.width / 2, -0.01, size.width, -0.01, size.width, -0.01);
    path.cubicTo(size.width, -0.01, size.width, -0.01, size.width, -0.01);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

