import 'package:flutter/material.dart';
import 'colors.dart';


class MyPainting extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    // Outer Circle:
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

    // Inner Circle:
    // final Paint innerPaint = Paint()
    //   ..color = BaseColors.light
    //   ..style = PaintingStyle.fill;
    // final innerRadius = radius * 0.2;
    // canvas.drawCircle(center, innerRadius, innerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}




// class MyPainting extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..color = AppBarColors.circle
//       ..strokeWidth = 4
//       ..style = PaintingStyle.fill;
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = size.width / 2;

//     canvas.drawCircle(center, radius, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }