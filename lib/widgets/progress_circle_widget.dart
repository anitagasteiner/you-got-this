import 'package:flutter/material.dart';
import '../common/colors.dart';

class ProgressCircle extends StatelessWidget {
  const ProgressCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(BaseColors.main),
      backgroundColor: BaseColors.accent,
      strokeWidth: 8,
      strokeCap: StrokeCap.round,
      semanticsLabel: 'Daten werden geladen.',
    );
  }

}
