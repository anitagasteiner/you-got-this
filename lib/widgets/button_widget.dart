import 'package:flutter/material.dart';
import '../common/colors.dart';

class BasicButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData icon;

  const BasicButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        icon,
        color: BaseColors.dark,
      ),
      label: Text(text),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: BtnColors.back,
        foregroundColor: BtnColors.front,
      ),
    );
  }

}



            