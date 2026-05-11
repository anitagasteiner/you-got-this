import 'package:flutter/material.dart';
import '../../themes/colors.dart';


class LogoBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = SweepGradient(
        colors: [          
          ScaleColors.toDo,
          ScaleColors.toDoSoon,
          ScaleColors.stillFine,
          ScaleColors.doneRecently,
          ScaleColors.done,
        ],
        // stops: [0.0, 0.3, 0.6, 0.8, 1.0],
      ).createShader(rect);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

