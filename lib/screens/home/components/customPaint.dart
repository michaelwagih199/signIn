
//Copy this CustomPainter code to the Bottom of the File
import 'package:flutter/material.dart';

class CustomArchHome extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width,size.height*0.03603604);
    path_0.cubicTo(size.width,size.height*0.2821378,size.width*0.9473212,size.height*0.5181577,size.width*0.8535523,size.height*0.6921802);
    path_0.cubicTo(size.width*0.7597859,size.height*0.8661982,size.width*0.6326083,size.height*0.9639640,size.width*0.5000000,size.height*0.9639640);
    path_0.cubicTo(size.width*0.3673917,size.height*0.9639640,size.width*0.2402148,size.height*0.8662027,size.width*0.1464467,size.height*0.6921802);
    path_0.cubicTo(size.width*0.05267835,size.height*0.5181622,size.width*0.02002328,size.height*-0.02702703,size.width*0.1523956,0);
    path_0.lineTo(size.width*0.5000000,size.height*0.03603604);
    path_0.lineTo(size.width,size.height*0.03603604);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xffE8E9EA).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = Color(0xffDA9456).withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(0,size.height*-0.004504505,size.width,size.height*0.04054054),paint_1_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}