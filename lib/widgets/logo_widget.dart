import 'package:flutter/material.dart';
import '../common/colors.dart';
import '../common/painting.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: const Size(100, 100),
          painter: MyPainting(),
        ),
        Icon(
          Icons.cached,
          size: 40,
          color: AppBarColors.icon,
          semanticLabel: '',
        ),
      ],
    );
  }

}

