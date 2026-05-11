import 'package:flutter/material.dart';
import '../../themes/colors.dart';
import 'logo_background.dart';


class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: const Size(100, 100),
          painter: LogoBackground(),
        ),
        RotatedBox(
          quarterTurns: 1,
          child: Icon(
            Icons.replay_circle_filled_outlined,
            size: 40,
            color: BaseColors.light,
            semanticLabel: '',
          ),
        ),
      ],
    );
  }

}

