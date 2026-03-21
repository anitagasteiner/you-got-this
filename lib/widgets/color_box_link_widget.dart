import 'package:flutter/material.dart';
import '../calc.dart';

class ColorBoxLink extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;
  final String category;

  const ColorBoxLink({
    super.key,
    required this.color,
    required this.onTap,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: getWidth(category),
          height: 35,
        ),
      ),
    );
  }

}