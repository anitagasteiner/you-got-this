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
        RotatedBox(
          quarterTurns: 1,
          child: Icon(
            // Icons.cached,
            // Icons.circle,
            Icons.replay_circle_filled_outlined,
            // Icons.replay_rounded,
            size: 40,
            color: BaseColors.light,
            semanticLabel: '',
          ),
        ),
      ],
    );
  }

}

